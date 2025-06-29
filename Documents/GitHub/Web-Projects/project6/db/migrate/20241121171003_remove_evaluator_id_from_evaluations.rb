class RemoveEvaluatorIdFromEvaluations < ActiveRecord::Migration[7.0]
  def change
    remove_column :evaluations, :evaluator_id, :integer
  end
end
