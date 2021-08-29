class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :events, through: :tagmaps
  has_many :venues, through: :tagmaps
  has_many :artists, through: :tagmaps
end
