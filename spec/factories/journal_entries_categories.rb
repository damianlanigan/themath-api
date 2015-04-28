# == Schema Information
#
# Table name: journal_entries_categories
#
#  journal_entry_id    :integer
#  journal_category_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  id                  :integer
#

FactoryGirl.define do
  factory :journal_entries_category do
    journal_entry_id 1
    journal_category_id 1
  end

end
