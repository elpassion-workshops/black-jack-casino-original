class GameRound < ApplicationRecord
  serialize :cards_left, Array
  serialize :cards_played, Array
end
