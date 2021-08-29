class Event < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :venue
    belongs_to :artist
    has_many :tagmaps, dependent: :destroy
    has_many :tags, through: :tagmaps
    def start_time
        self.event_date
    end
    def end_time
        self.event_date
    end
end
