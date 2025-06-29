class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.references :presentation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :score
      t.text :comments

      t.timestamps
    end
  end
end
