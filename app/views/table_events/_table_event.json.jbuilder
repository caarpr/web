json.extract! table_event, :id, :starts_at, :ends_at, :postcards_collected, :volunteers_collected, :status, :created_at, :updated_at
json.url table_event_url(table_event, format: :json)
