class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
  enum sex: { man: 0, woman: 1}
  
  enum age: {
    '---': 0,
    early_teeens: 1,
    late_teens: 2,
    early_twenties: 3,
    late_twenties: 4,
    early_thirties: 5,
    late_thirties: 6,
    early_forties: 7,
    late_forties: 8,
    early_fifties: 9,
    late_fifties: 10,
    over_sixties: 11,
  }
  
end
