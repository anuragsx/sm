class AddFieldsToListing < ActiveRecord::Migration
  def self.up
  	add_column :listings, :featured, :boolean
  	add_column :listings, :expired_at, :datetime
  end

  def self.down
  	remove_column :listings, :featured
  	remove_column :listings, :expired_at
  end
end
