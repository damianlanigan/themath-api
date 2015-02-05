class UserMoodCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :mood_category
end

# == Schema Information
#
# Table name: user_mood_categories
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  mood_category_id :integer
#  active           :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
