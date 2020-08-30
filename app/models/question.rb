class Question < ApplicationRecord
  belongs_to :game
  validates :q, :aa, :ab, :ac, :ad, :correct, :link, presence: true
end
