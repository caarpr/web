class TableLocation < ApplicationRecord
  has_many :table_owners
  has_many :owners, through: :table_owners, source: :user

  has_many :table_events
end
