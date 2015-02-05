class MoodCategory < ActiveRecord::Base

	has_many :user_mood_categories
	has_many :users, through: :user_mood_categories


end

# == Schema Information
#
# Table name: mood_categories
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  core        :boolean
#  description :text
#  icon        :string
#  color       :string
#
