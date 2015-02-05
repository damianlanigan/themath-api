FactoryGirl.define do
  factory :user_mood_category do
    user nil
mood_category nil
active false
  end

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
