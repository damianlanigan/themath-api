class CreateUserJournalCategories < ActiveRecord::Migration
  def change
    create_table :user_journal_categories do |t|
      t.references :user, index: true
      t.references :journal_category, index: true
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :user_journal_categories, :users
    add_foreign_key :user_journal_categories, :journal_categories
  end
end
