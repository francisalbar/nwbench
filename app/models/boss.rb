class Boss < ActiveRecord::Base
  belongs_to :wing
  has_many :wants
  has_many :toons, :through => :wants
end
