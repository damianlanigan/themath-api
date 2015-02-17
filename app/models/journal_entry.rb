class JournalEntry < ActiveRecord::Base
	belongs_to :user
  belongs_to :journal_category

  validates :user_id, presence: true
  validates :score, presence: true
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
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
