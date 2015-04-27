require 'rails_helper'

RSpec.describe JournalCategory, :type => :model do
  let(:journal_category) { FactoryGirl.build :journal_category }
  subject { journal_category }

  

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
