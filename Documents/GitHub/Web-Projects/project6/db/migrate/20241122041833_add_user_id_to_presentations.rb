class AddUserIdToPresentations < ActiveRecord::Migration[7.0]
  def change
    add_reference :presentations, :user, null: true, foreign_key: true
  end
end
