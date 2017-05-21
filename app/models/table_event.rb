class TableEvent < ApplicationRecord
  has_many :attendees, as: :event

  belongs_to :table_location

  scope :for_ward, ->(ward) { joins(:table_location).where(table_locations: {ward: ward}) }
  scope :during, ->(range) { where(starts_at: range) }

  def volunteers_attended
    attendees.count
  end

  def fully_staffed?
    attendees.yes.count >= 3
  end

  def risk
    return nil if starts_at < Time.now

    return 'green' if fully_staffed?

    if starts_at > 1.week.from_now
      'yellow'
    else
      'red'
    end
  end
end
