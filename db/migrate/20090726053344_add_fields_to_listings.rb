class AddFieldsToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :listingtype, :string
    add_column :listings, :vin, :string
    add_column :listings, :body, :string
    add_column :listings, :transmission, :string
    add_column :listings, :engine, :string
    add_column :listings, :exterior_color, :string
    add_column :listings, :interior_color, :string
    add_column :listings, :mileage, :integer
    add_column :listings, :drive, :string
    add_column :listings, :doors, :integer
    add_column :listings, :fuel, :string
    add_column :listings, :desc, :string
  end

  def self.down
    remove_column :listings, :listingtype
    remove_column :listings, :vin
    remove_column :listings, :body
    remove_column :listings, :transmission
    remove_column :listings, :engine
    remove_column :listings, :exterior_color
    remove_column :listings, :interior_color
    remove_column :listings, :mileage
    remove_column :listings, :drive
    remove_column :listings, :doors
    remove_column :listings, :fuel
    remove_column :listings, :desc
  end
end
