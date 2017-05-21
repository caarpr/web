class TrackAttendeeRsvp < ActiveRecord::Migration[5.0]
  def change
    add_column :attendees, :rsvp, :string, default: "maybe"
  end
end
