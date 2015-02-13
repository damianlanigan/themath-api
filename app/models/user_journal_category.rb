class UserJournalCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :journal_category
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
