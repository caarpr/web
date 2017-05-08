class AddVolunteerName < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :first_name, :string
    add_column :volunteers, :last_name, :string
  end
end
