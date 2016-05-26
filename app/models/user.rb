class User < ActiveRecord::Base

  has_many :followings_as_follower, class_name: 'Following', foreign_key: :follower_id
  has_many :followings_as_followee, class_name: 'Following', foreign_key: :followee_id
  has_many :followers, through: :followings_as_followee
  has_many :followees, through: :followings_as_follower
end
