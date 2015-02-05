require 'rails_helper'

RSpec.describe UserMoodCategory, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
