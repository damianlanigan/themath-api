class JournalCategory < ActiveRecord::Base
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
