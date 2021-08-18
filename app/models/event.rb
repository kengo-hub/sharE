class Event < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :venue
    has_many :artist
end
