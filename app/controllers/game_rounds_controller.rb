class GameRoundsController < ApplicationController
  before_action :load_game_round, only: [:show, :destroy]
  before_action :load_game_rounds_service, only: [:create, :show]

  def create
    redirect_to @game_rounds_service.create
  end

  def show
    @cards = @game_round.cards_played
    @points = @game_rounds_service.points @game_round
    @black_jack = @game_rounds_service.black_jack? @game_round
    @bust = @game_rounds_service.bust? @game_round
  end

  def destroy
    @game_round.destroy
    redirect_to root_path
  end

  private

  def load_game_round
    @game_round = GameRound.find params[:id]
  end

  def load_game_rounds_service
    @game_rounds_service = GameRoundsService.new
  end
end
