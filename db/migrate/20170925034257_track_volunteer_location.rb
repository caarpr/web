class TrackVolunteerLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :latitude, :float
    add_column :volunteers, :longitude, :float
    add_column :volunteers, :address, :string
  end
end
