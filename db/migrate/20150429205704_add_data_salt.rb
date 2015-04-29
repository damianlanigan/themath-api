class AddDataSalt < ActiveRecord::Migration
  def change
    add_column :journal_entries, :encrypted_note_salt, :string
    add_column :journal_entries, :encrypted_note_iv, :string  
  end
end
