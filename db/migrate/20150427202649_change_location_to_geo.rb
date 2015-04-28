class ChangeLocationToGeo < ActiveRecord::Migration
  def change
    remove_column :journal_entries, :location
    add_column :journal_entries, :location, :point, :geographic => true
  end
end
