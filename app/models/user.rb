class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }
end
