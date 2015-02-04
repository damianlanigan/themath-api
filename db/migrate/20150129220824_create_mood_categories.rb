class CreateMoodCategories < ActiveRecord::Migration
  def change
    create_table :mood_categories do |t|

      t.timestamps null: false
    end
  end
end
