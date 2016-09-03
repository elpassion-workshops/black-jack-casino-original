class GameRoundsService
  BLACK_JACK = 21

  def create
    GameRound.new.tap do |game_round|
      game_round.cards_left = CardDeck.new.to_a
      game_round.cards_played = []
      game_round.save
      2.times { hit game_round }
    end
  end

  def hit(game_round)
    random_card = game_round.cards_left.sample
    if random_card.nil?
      false
    else
      game_round.cards_left.delete random_card
      game_round.cards_played << random_card
      game_round.save
    end
  end

  def points(game_round)
    ace_count = 0
    initial_sum = game_round.cards_played.sum do |card|
      if card.ace?
        ace_count += 1
        1
      elsif card.face?
        10
      else
        card.value.to_i
      end
    end
    inject_bonus_points_for_aces initial_sum, ace_count
  end

  def black_jack?(game_round)
    points(game_round) == BLACK_JACK
  end

  def bust?(game_round)
    points(game_round) > BLACK_JACK
  end

  private

  def inject_bonus_points_for_aces(initial_sum, ace_count)
    Array.new(ace_count) { 10 }.inject(initial_sum) do |sum, points|
      sum + points > BLACK_JACK ? sum : sum + points
    end
  end
end
