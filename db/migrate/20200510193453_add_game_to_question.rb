class AddGameToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :game, foreign_key: true
  end
end
