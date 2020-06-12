class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user
  wrap_parameters :user, include: [:username, :email, :password]

  def index
    @users = User.all
    render json: UserSerializer.new(@users)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user), status: :accepted
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: UserSerializer.new(@user)
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
