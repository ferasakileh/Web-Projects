class AddEventToPresentations < ActiveRecord::Migration[7.0]
  def change
    add_reference :presentations, :event, null: true, foreign_key: true
  end
end
