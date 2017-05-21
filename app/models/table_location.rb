class TableLocation < ApplicationRecord
  has_many :table_owners
  has_many :owners, through: :table_owners, source: :user

  has_many :table_events

  def postcards_collected
    table_events.sum(:postcards_collected)
  end

  def volunteers_collected
    table_events.sum(:volunteers_collected)
  end
end
