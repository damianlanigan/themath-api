require 'rails_helper'

RSpec.describe JournalEntry, :type => :model do
  let(:journal_entry) { FactoryGirl.build :journal_entry }
  subject { journal_entry }

  it { should belong_to :user }
  it { should belong_to :journal_category }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score).only_integer.is_less_than_or_equal_to(100).is_greater_than_or_equal_to(0) }

end

# == Schema Information
#
# Table name: journal_entries
#
#  id                  :integer          not null, primary key
#  score               :integer
#  note                :text
#  image               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  journal_category_id :integer
#
