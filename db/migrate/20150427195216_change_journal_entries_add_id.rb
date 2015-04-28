class ChangeJournalEntriesAddId < ActiveRecord::Migration
  def change
    add_column  :journal_entries_categories, :id, :integer
    add_index :journal_entries_categories, :id, :unique => true
  end
end
