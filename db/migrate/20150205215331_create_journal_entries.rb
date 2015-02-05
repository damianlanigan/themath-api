class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.integer :score
      t.text :note
      t.string :image

      t.timestamps null: false
    end
  end
end
