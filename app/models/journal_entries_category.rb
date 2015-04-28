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

class JournalEntriesCategory < ActiveRecord::Base
  belongs_to :journal_category
  belongs_to :journal_entry

  validates_uniqueness_of :journal_entry_id,    :scope => :journal_category_id
end
