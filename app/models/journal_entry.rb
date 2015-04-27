class JournalEntry < ActiveRecord::Base
	belongs_to :user

  has_many :journal_entries_categories
  has_many :journal_categories, through: :journal_entries_categories

  validates :user_id, presence: true
  validates :score, presence: true
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
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
#  location   :point
#  timestamp  :datetime
#
