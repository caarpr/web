class TrackSuperusers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :superuser, :boolean, default: false
  end
end
