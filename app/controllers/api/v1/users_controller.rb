class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user, only: [:update]
  # wrap_parameters :user, include: [:username, :email, :password]
  skip_before_action :authorized, only: :create

  # def signup
  #   user = User.new(user_params)
  #   if user.save
  #     render json: { token: Auth.create_token(user) }
  #   else
  #     render json: { errors: user.errors.full_messages}, status: 500
  #   end
  # end

  def index
    @users = User.all
    render json: UserSerializer.new(@users)
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     render json: UserSerializer.new(@user), status: :accepted
  #   else
  #     render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
  #   end
  # end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'Failed to create user.' }, status: :not_acceptable
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: UserSerializer.new(@user)
  end

  def destroy

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
    params.require(:user).permit(:username, :email, :password)
  end
end
