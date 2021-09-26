class Event < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :venue
    belongs_to :artist
    has_many :tagmaps, dependent: :destroy
    has_many :tags, through: :tagmaps
    
    def save_events(saveevent_tags)
        # 現在のユーザーの持っているskillを引っ張ってきている
        current_tags = self.tags.pluck(:name) unless self.tags.nil?
        # 今eventが持っているタグと今回保存されたものの差をすでにあるタグとする。古いタグは消す。
        old_tags = current_tags - saveevent_tags
        # 今回保存されたものと現在の差を新しいタグとする。新しいタグは保存
        new_tags = savepost_tags - current_tags
        
        # Destroy old taggings:
        old_tags.each do |old_name|
          self.tags.delete Tag.find_by(name:old_name)
        end
    
        # Create new taggings:
        new_tags.each do |new_name|
          event_tag = Tag.find_or_create_by(name:new_name)
          # 配列に保存
          self.tags << event_tag
        end
    end
    
    def start_time
        self.event_date
    end
    def end_time
        self.event_date
    end
end
