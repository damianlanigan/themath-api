class ChangeJournalEntries < ActiveRecord::Migration
  def change
    remove_column :journal_entries, :image
    remove_column :journal_entries, :journal_category_id
    add_column :journal_entries, :location, :point
    add_column :journal_entries, :timestamp, :datetime
  end
end
