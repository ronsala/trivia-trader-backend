# require 'JWT'

# class Auth

#   def self.create_token(user_object)
#     byebug
#     payload = { user: JSON.parse(user_object.to_json) }
#     # TODO: Set secret and algo to env variables.

#     # token = JWT.encode(payload, secret, 'HS256')
#     token = JWT.encode(payload, secret, algo)
#   end

#   def self.decode_token(token)
#     secret = Rails.application.credentials.jwt[:secret]
#     decoded = JWT.decode(token, secret, true, { algorithm: 'HS256' })
#   end
  
# end
