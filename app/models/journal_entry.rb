class JournalEntry < ActiveRecord::Base
	belongs_to :user

  has_many :journal_entries_categories, dependent: :destroy 
  has_many :journal_categories, through: :journal_entries_categories

  validates :user_id, presence: true
  validates :score, presence: true
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :categories, presence: true

  after_initialize :init

  def init
    self.note  ||= ""          
    self.timestamp ||= Time.now
  end

  def as_json(options = { })
      to_json = super(options)
      to_json[:categories]  = categories
      to_json
  end

  def categories=(names)
    self.journal_categories = names.map do |name|
      JournalCategory.find_or_create_by( name: name)
    end
  end

  def categories
    self.journal_categories.map(&:name)
  end


end

# == Schema Information
#
# Table name: journal_entries
#
#  id         :integer          not null, primary key
#  score      :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  timestamp  :datetime
#  lat        :decimal(10, 6)
#  lng        :decimal(10, 6)
#
