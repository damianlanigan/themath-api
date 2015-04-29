class JournalCategory < ActiveRecord::Base
  has_many :journal_entries_categories
  has_many :journal_entries, through: :journal_entries_categories
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
