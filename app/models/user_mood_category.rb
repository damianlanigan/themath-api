class UserMoodCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :mood_category
end
