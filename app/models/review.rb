class Review < ApplicationRecord

  belongs_to :sauna_facility, optional: true
  belongs_to :user

  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  
  
end
