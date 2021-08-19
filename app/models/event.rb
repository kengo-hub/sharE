class Event < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :venue
    belongs_to :artist
end
