class CreateUserMoodCategories < ActiveRecord::Migration
  def change
    create_table :user_mood_categories do |t|
      t.references :user, index: true
      t.references :mood_category, index: true
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :user_mood_categories, :users
    add_foreign_key :user_mood_categories, :mood_categories
  end
end
