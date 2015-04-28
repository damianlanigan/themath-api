FactoryGirl.define do
  factory :journal_category do
    name "MyString"
  end

end

# == Schema Information
#
# Table name: journal_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
