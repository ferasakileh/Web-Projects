class Event < ApplicationRecord
  belongs_to :user # User is the instructor
  has_many :presentations, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true
end
