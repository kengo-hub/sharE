class Event < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :venue
    belongs_to :artist
    def start_time
        self.event_date
    end
    def end_time
        self.event_date
    end
end
