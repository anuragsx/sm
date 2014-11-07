class AddSortOrderToPowermakes < ActiveRecord::Migration
  def self.up
  	add_column :powermakes, :sort_order, :integer
  end

  def self.down
  	remove_column :powermakes, :sort_order
  end
end
