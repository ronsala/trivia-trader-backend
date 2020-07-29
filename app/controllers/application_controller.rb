class ApplicationController < ActionController::API
  # TODO
  # include Knock::Authenticable
  # before_action :authenticate_user
  # before_action :set_default_format

  # private

  # def set_default_format
  #   request.format = :json
  # end

  before_action :authorized

  # TODO: Replace secret with ENV variable.
  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        byebug
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
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
