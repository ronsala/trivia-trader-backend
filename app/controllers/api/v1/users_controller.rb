class Api::V1::UsersController < ApplicationController
  wrap_parameters :user, include: [:username, :email, :password]
  skip_before_action :authorized, only: [:index, :create]

  def index
    @users = User.all.sort_by { |user| user.username.downcase }
    render json: UserSerializer.new(@users)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: UserSerializer.new(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def favorite
    favs = @user.favorites
    favs.push(user_params[:favorite_category_id])
    @user.update(favorites: favs)
    render json: UserSerializer.new(@user)
  end

  def favorites
    @user = User.find_by(id: params[:id])
    render json: UserSerializer.new(@user)
  end

  def find
    @user = User.find_by(email: params[:user][:email])
    if @user
      render json: @user
    else
      @errors = @user.errors.full_messages
      render json: @errors
    end
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :favorite_category_id, :id)
  end
end
