class DropUserJournalCategoriesTable < ActiveRecord::Migration
  def up 
    drop_table :user_journal_categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
