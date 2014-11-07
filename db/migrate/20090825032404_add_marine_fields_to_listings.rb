class AddMarineFieldsToListings < ActiveRecord::Migration
  def self.up
  	add_column :listings, :subcategory, :string
  	add_column :listings, :length, :string
  	add_column :listings, :hull, :string
  end

  def self.down
  	remove_column :listings, :subcategory
  	remove_column :listings, :length
  	remove_column :listings, :hull
  end
end
