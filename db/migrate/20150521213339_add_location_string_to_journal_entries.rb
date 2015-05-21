class AddLocationStringToJournalEntries < ActiveRecord::Migration
  def change
    add_column :journal_entries, :location_string, :string
  end
end
