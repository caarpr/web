class TrackTableInstructions < ActiveRecord::Migration[5.0]
  def change
    add_column :table_locations, :instructions, :text
  end
end
