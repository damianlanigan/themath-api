class DropMoods < ActiveRecord::Migration
  def up
    drop_table :moods
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
