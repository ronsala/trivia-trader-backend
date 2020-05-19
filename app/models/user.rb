class User < ApplicationRecord
  has_many :games, dependent: :destroy

  validates :username, :email, presence: true, uniqueness: true
end
