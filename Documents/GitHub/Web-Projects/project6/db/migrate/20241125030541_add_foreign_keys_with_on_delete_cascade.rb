class AddForeignKeysWithOnDeleteCascade < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :evaluations, :users, on_delete: :cascade

    add_foreign_key :events, :users, on_delete: :cascade

    add_foreign_key :presentations, :users, on_delete: :cascade
  end
end
