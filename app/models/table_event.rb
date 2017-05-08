class TableEvent < ApplicationRecord
  has_many :attendees, as: :event

  belongs_to :table_location

  scope :for_ward, ->(ward) { joins(:table_location).where(table_locations: {ward: ward}) }
  scope :during, ->(range) { where(starts_at: range) }

  def volunteers_attended
    attendees.count
  end
end
