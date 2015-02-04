class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.references :user, index: true
      t.integer :score
      t.text :note
      t.string :image

      t.timestamps null: false
    end
    add_foreign_key :moods, :users
  end
end
