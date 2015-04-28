require 'rails_helper'

RSpec.describe JournalCategory, :type => :model do
  let(:journal_category) { FactoryGirl.build :journal_category }
  subject { journal_category }

  pending "add some examples to (or delete) #{__FILE__}"

end

# == Schema Information
#
# Table name: journal_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
