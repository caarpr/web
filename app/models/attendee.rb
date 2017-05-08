class Attendee < ApplicationRecord
  belongs_to :volunteer
  belongs_to :event, polymorphic: true
end
