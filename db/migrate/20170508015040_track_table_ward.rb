class TrackTableWard < ActiveRecord::Migration[5.0]
  def change
    add_column :table_locations, :ward, :integer
  end
end
