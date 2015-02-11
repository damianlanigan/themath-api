class Mood < ActiveRecord::Base
  belongs_to :user
end

# == Schema Information
#
# Table name: moods
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
