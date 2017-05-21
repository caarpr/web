class TrackTableOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :table_owners do |t|
      t.references :table_location
      t.references :user
    end
  end
end
