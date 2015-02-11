FactoryGirl.define do
  factory :user_journal_category do
    user nil
category nil
active false
  end

end

# == Schema Information
#
# Table name: user_journal_categories
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  journal_category_id :integer
#  active              :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
