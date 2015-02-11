FactoryGirl.define do
  factory :journal_entry do
    score 1
note "MyText"
image "MyString"
  end

end

# == Schema Information
#
# Table name: journal_entries
#
#  id                  :integer          not null, primary key
#  score               :integer
#  note                :text
#  image               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  journal_category_id :integer
#
