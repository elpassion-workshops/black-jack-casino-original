class CreateGameRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :game_rounds do |t|
      t.text :cards_left
      t.text :cards_played
      t.timestamps
    end
  end
end
