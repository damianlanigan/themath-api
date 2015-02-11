class JournalEntry < ActiveRecord::Base
	belongs_to :user
  belongs_to :category
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
