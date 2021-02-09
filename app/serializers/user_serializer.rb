class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :favorites
end
