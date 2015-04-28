class RecreateJournalEntriesCategories < ActiveRecord::Migration
  def change
    drop_table :journal_entries_categories
    create_table :journal_entries_categories do |t|
      t.integer :journal_entry_id
      t.integer :journal_category_id

      t.timestamps null: false
    end
    add_index :journal_entries_categories, :journal_category_id
    add_index :journal_entries_categories, ["journal_category_id","journal_entry_id"], :unique => true, :name => "entry_category"

  end
end
