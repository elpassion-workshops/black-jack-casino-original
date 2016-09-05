module GameRoundsHelper
  def card_suit_symbol(card)
    case card.suit
      when 'C' then '♣'
      when 'D' then '♦'
      when 'H' then '♥'
      when 'S' then '♠'
      else
        ''
    end
  end
end
