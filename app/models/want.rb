class Want < ActiveRecord::Base
  belongs_to :toon
  belongs_to :boss

  validates :boss_id, :presence => true
  validates :toon_id, :presence => true
  validates :item_id, :presence => true
  validates :item_name, :presence => true
  validates_uniqueness_of :item_id, :scope => [:boss_id, :toon_id]

end
