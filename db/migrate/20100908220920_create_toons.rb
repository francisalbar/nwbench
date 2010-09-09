class CreateToons < ActiveRecord::Migration
  def self.up
    create_table :toons do |t|
      t.integer :toon_id
      t.string :name
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :toons
  end
end
