class AddCoreToMoodCategories < ActiveRecord::Migration
  def change
    add_column :mood_categories, :name, :string
    add_column :mood_categories, :core, :boolean
    add_column :mood_categories, :description, :text
    add_column :mood_categories, :icon, :string
    add_column :mood_categories, :color, :string
  end
end
