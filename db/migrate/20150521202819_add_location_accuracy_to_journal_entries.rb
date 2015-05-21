class AddLocationAccuracyToJournalEntries < ActiveRecord::Migration
  def change
    add_column :journal_entries, :location_accuracy, :float
  end
end
