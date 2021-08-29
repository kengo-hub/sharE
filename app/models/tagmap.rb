class Tagmap < ApplicationRecord
  belongs_to :event
  belongs_to :venue
  belongs_to :artist
  belongs_to :tag
end
