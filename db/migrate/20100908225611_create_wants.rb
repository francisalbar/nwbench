class CreateWants < ActiveRecord::Migration
  def self.up
    create_table :wants do |t|
      t.integer :toon_id
      t.integer :boss_id
      t.integer :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :wants
  end
end
