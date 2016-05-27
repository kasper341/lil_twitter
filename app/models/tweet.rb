class Tweet < ActiveRecord::Base
  belongs_to :user

  MAX_CONTENT_LENGTH = 140
  validates :content, length: { maximum: MAX_CONTENT_LENGTH, too_long: "#{MAX_CONTENT_LENGTH} characters is the maximum allowed" }
end
