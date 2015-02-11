FactoryGirl.define do
  factory :journal_category do
    name "MyString"
core false
icon "MyString"
color "MyString"
  end

end

# == Schema Information
#
# Table name: journal_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  core       :boolean
#  icon       :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
