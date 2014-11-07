class AddAutoCategories < ActiveRecord::Migration
  def self.up
  	['Coupe/Compact','Convertible','Sport','Van','Wagon','SUV','Luxury','Truck','Sedan','Hybrid','Commercial'].each do |s|
  		Autocategories.new(:category => s).save
 		end
  end

  def self.down
  	Autocategories.destroy_all
  end
end
