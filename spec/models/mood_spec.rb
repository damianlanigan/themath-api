require 'rails_helper'

RSpec.describe Mood, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: moods
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  score      :integer
#  note       :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
