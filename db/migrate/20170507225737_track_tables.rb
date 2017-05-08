class TrackTables < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :email

      t.timestamps
    end

    create_table :table_locations do |t|
      t.string :name

      t.string :status, default: "recurring"

      t.float :latitude
      t.float :longitude

      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end

    create_table :table_events do |t|
      t.references :table_location

      t.datetime :starts_at
      t.datetime :ends_at

      t.integer :postcards_collected
      t.integer :volunteers_collected

      t.string :status, "scheduled"

      t.timestamps
    end

    create_table :attendees do |t|
      t.references :event, polymorphic: true
      t.references :volunteer
      t.string :status, default: "attending"

      t.timestamps
    end
  end
end
