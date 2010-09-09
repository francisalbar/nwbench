class AddItemNameToWants < ActiveRecord::Migration
  def self.up
    add_column :wants, :item_name, :string
  end

  def self.down
    remove_column :wants, :item_name
  end
end
