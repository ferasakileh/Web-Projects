class Presentation < ApplicationRecord
  belongs_to :event 
  belongs_to :user
  
  has_many :evaluations, dependent: :destroy # added for evaluations
  
  validates :title, presence: true, length: {maximum:30}
  validates :date, presence: true

  has_one_attached :file

  #has_many :evaluations
end