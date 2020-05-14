class AddGameToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :game, null: false, foreign_key: true
  end
end
