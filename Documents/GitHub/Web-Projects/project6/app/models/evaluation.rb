class Evaluation < ApplicationRecord
  belongs_to :presentation
  belongs_to :user

  validate :presenter_cannot_evaluate_own_presentation

  private

  def presenter_cannot_evaluate_own_presentation
    if presentation && presentation.user.name == user.name
      errors.add(:presentation_id, "cannot be evaluated by presenter.")
    end
  end
end
