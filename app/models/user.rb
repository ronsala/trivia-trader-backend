class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true

  def self.from_token_payload(payload)
    self.find payload[:sub]
  end
end
