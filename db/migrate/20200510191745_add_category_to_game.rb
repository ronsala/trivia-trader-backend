class AddCategoryToGame < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :category, foreign_key: true
  end
end
