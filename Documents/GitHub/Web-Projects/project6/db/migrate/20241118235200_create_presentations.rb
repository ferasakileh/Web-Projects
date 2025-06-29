class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :user

      t.timestamps
    end
  end
end
