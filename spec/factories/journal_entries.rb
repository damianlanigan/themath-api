FactoryGirl.define do
  factory :journal_entry do
    user_id 1
    score 99
    note "Best day ever."
  end

end

# == Schema Information
#
# Table name: journal_entries
#
#  id         :integer          not null, primary key
#  score      :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  timestamp  :datetime
#  lat        :decimal(10, 6)
#  lng        :decimal(10, 6)
#
