class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :game_id, :q, :aa, :ab, :ac, :ad, :correct, :link 
end
