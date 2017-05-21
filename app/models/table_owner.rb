class TableOwner < ActiveRecord::Base

  belongs_to :table_location
  belongs_to :user

end

