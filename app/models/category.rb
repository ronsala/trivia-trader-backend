class Category < ApplicationRecord
  has_many :games, dependent: :destroy
end
