class Api::V1::GamesController < ApplicationController
  before_action :authenticate_user
  before_action :set_game, only: %i[update destroy]

  def index
    @games = Game.all
    render json: GameSerializer.new(@games)
  end

  def create
    @game = game.new(game_params)
    if @game.save
      render json: gameSerializer.new(@game), status: :accepted
    else
      render json: {errors: @game.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    render json: GameSerializer.new(@game)
  end

  def destroy

  end

  def set_game
    @game = Game.find(id: params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:title, :category_id, :user_id)
  end
end