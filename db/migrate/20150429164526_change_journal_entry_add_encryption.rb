class ChangeJournalEntryAddEncryption < ActiveRecord::Migration
  def change
    rename_column :journal_entries, :note, :encrypted_note
    #add_column :journal_entries, :encrypted_note_salt, :string
    #add_column :journal_entries, :encrpyted_note_iv, :string  
  end
end
