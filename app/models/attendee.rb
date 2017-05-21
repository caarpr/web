class Attendee < ApplicationRecord
  belongs_to :volunteer
  belongs_to :event, polymorphic: true

  scope :yes, -> { where(rsvp: "yes") }
  scope :no, -> { where(rsvp: "no") }
  scope :maybe, -> { where(rsvp: "maybe") }
end
