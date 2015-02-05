class AddReferencesToJournalEntries < ActiveRecord::Migration
  def change
    change_table :journal_entries do |t|
      t.references :user, index: true
      t.references :journal_category, index: true
    end
    add_foreign_key :journal_entries, :users
    add_foreign_key :journal_entries, :journal_categories
  end
end
