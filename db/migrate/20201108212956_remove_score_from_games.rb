class RemoveScoreFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :score, :integer
  end
end
