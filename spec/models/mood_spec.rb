require 'rails_helper'

describe Mood do
  let(:mood) { FactoryGirl.build  :mood }
  subject { mood }

  it { should belong_to :user}

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score).only_integer.is_less_than_or_equal_to(100).is_greater_than_or_equal_to(0) }

  

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
