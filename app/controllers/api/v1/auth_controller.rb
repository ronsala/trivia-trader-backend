class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :verify]

  def create
    @user = User.find_by(email: user_login_params[:email])
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, stauts: :unauthorized
    end
  end

  def verify
    decoded = decode_token
    user = User.find(decoded[0]["user_id"])
    if user
      render json: UserSerializer.new(user)
    else
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  def user_login_params
    params.require(:auth).permit(:email, :password)
  end
end
