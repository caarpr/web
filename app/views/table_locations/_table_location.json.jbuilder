json.extract! table_location, :id, :name, :status, :latitude, :longitude, :starts_at, :ends_at, :created_at, :updated_at
json.url table_location_url(table_location, format: :json)
