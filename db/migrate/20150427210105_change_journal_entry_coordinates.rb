class ChangeJournalEntryCoordinates < ActiveRecord::Migration
  def change
    remove_column :journal_entries, :location
    add_column :journal_entries, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :journal_entries, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
