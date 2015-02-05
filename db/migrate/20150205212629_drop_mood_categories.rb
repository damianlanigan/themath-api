class DropMoodCategories < ActiveRecord::Migration

	def change
    remove_column :user_mood_categories, :user_id, :integer
    remove_column :user_mood_categories, :mood_category_id, :integer

    drop_table :moods
    drop_table :mood_categories
  	drop_table :user_mood_categories
  end

end
