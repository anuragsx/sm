class AddOrderToMotomakes < ActiveRecord::Migration
  def self.up
  	add_column :motomakes, :sort_order, :integer
  end

  def self.down
  	remove_column :motomakes, :sort_order
  end
end
