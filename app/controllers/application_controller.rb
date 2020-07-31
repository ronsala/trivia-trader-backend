class ApplicationController < ActionController::API
  before_action :authorized

  SECRET = Rails.application.credentials.jwt[:secret]
  ALGO = Rails.application.credentials.jwt[:algo]

  def encode_token(payload)
    JWT.encode(payload, SECRET)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, SECRET, true, algorithm: ALGO)
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
