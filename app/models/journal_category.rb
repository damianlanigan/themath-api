class JournalCategory < ActiveRecord::Base
	has_many :users
  has_many :users, through: :user_journal_categories

end

# == Schema Information
#
# Table name: journal_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  core       :boolean
#  icon       :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
