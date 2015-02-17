require 'rails_helper'

RSpec.describe JournalCategory, :type => :model do
  let(:journal_category) { FactoryGirl.build :journal_category }
  subject { journal_category }

  
  it { should have_many(:users).through(:user_journal_categories) }

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
