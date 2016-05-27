class User < ActiveRecord::Base
  include BCrypt

  has_many :followings_as_follower, class_name: 'Following', foreign_key: :follower_id
  has_many :followings_as_followee, class_name: 'Following', foreign_key: :followee_id
  has_many :followers, through: :followings_as_followee
  has_many :followees, through: :followings_as_follower
  has_many :tweets
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end


