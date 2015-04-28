class ChangeJournalEntriesCategories < ActiveRecord::Migration
  def change
    remove_column :journal_entries_categories, :id
    add_index :journal_entries_categories, ["journal_category_id","journal_entry_id"], :unique => true, :name => "entry_category"
  end
end
