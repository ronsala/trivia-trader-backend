class Api::V1::QuestionsController < ApplicationController
  skip_before_action :authorized, except: %[create update destroy]
  before_action :set_question, only: %i[update destroy]

  def index
    @questions = Question.all
    render json: QuestionSerializer.new(@questions)
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: QuestionSerializer.new(@question), status: :accepted
    else
      render json: {errors: @question.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      render json: QuestionSerializer.new(@question)
    else
      render json: {errors: @game.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy

  end

  def set_question
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:game_id, :q, :aa, :ab, :ac, :ad, :correct, :link)
  end
end