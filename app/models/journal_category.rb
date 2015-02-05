class JournalCategory < ActiveRecord::Base
	has_many :users
  has_many :users, through: :user_journal_category
end
