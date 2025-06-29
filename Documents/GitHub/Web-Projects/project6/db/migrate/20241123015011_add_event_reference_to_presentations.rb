class AddEventReferenceToPresentations < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:presentations, :event_id)
      add_reference :presentations, :event, null: false, foreign_key: true
    end
  end
end
