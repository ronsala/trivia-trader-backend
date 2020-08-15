class Game < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :category_id, :user_id, presence: true
end
