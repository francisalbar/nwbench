class Toon < ActiveRecord::Base
  belongs_to :role
  has_many :wants

  validates :role_id, :presence => true
  validates :name, :presence => true
end
