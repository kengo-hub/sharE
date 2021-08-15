class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :venue, optional: true
  belongs_to :event, optional: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
