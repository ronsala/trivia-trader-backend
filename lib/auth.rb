require 'JWT'

class Auth

  def self.create_token(user_object)
    payload = { user: JSON.parse(user_object.to_json) }
    # TODO: Set secret and algo to env variables.
    token = JWT.encode(payload, 'sekret', 'HS256')
  end

  def self.decode_token(token)
    decoded = JWT.decode(token, 'sekret', true, { algorithm: 'HS256' })
  end
  
end
