class CreateJournalEntriesCategories < ActiveRecord::Migration
  def change
    create_table :journal_entries_categories do |t|
      t.integer :journal_entry_id
      t.integer :journal_category_id

      t.timestamps null: false
    end
    add_index :journal_entries_categories, :journal_category_id
  end
end
