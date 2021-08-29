class Artist < ApplicationRecord
  has_many :event
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
end
