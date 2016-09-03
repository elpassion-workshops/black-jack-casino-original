module GameRoundsHelper
  def human_card_info(card)
    "#{human_card_pip(card)} of #{human_card_suit(card)}"
  end

  def human_card_pip(card)
    case card.pip
      when 'J' then 'Jack'
      when 'Q' then 'Queen'
      when 'K' then 'King'
      when 'A' then 'Ace'
      else
        card.pip
    end
  end

  def human_card_suit(card)
    case card.suit
      when 'C' then 'Clubs'
      when 'D' then 'Diamonds'
      when 'H' then 'Hearts'
      when 'S' then 'Spades'
      else
        ''
    end
  end
end