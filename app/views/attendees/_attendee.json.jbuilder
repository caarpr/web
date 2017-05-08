json.extract! attendee, :id, :volunteer_id, :status, :event_id, :event_type, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
