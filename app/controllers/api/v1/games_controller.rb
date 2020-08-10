class Api::V1::GamesController < ApplicationController
  skip_before_action :authorized, except: %i[create update destroy]
  before_action :set_game, only: %i[update destroy]

  def index
    games = Game.all
    @games = games.select { |game| game.questions != [] }
    render json: GameSerializer.new(@games)
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: GameSerializer.new(@game), status: :accepted
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