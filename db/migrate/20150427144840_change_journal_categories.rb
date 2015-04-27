class ChangeJournalCategories < ActiveRecord::Migration
  def change
    remove_column :journal_categories, :core 
    remove_column :journal_categories, :icon 
    remove_column :journal_categories, :color 
  end
end
