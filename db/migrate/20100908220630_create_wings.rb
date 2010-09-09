class CreateWings < ActiveRecord::Migration
  def self.up
    create_table :wings do |t|
      t.integer :wing_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :wings
  end
end
