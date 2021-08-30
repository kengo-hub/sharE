class Artist < ApplicationRecord
  has_many :events
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
end
