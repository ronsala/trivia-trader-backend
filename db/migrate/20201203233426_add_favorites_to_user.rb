class AddFavoritesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favorites, :bigint, array: true, default: []
  end
end
