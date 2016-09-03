class HitsController < ApplicationController
  def create
    game_round = GameRound.find params[:game_round_id]
    GameRoundsService.new.hit game_round
    redirect_to game_round
  end
end
