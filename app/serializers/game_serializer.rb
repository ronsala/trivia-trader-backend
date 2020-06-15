class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :category_id, :user_id
end
