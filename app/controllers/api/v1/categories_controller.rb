require 'Auth'

class Api::V1::CategoriesController < ApplicationController
  # before_action :authenticate_user

  def index
    token = request.env["HTTP_AUTHORIZATION"]
    if token && Auth.decode_token(token)
      @categories = Category.all
      render json: CategorySerializer.new(@categories)
    else
      render json: { error: { message: "You must have a valid token!"}}, status: 500
    end
  end
end