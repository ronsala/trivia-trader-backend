class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :q
      t.string :aa
      t.string :ab
      t.string :ac
      t.string :ad
      t.string :correct

      t.timestamps
    end
  end
end
