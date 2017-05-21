class User < ApplicationRecord

  has_many :table_owners
  has_many :table_locations, through: :table_owners

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
