class MoodCategory < ActiveRecord::Base

	has_many :user_mood_categories
	has_many :users, through: :user_mood_categories


end
