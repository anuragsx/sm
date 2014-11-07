class AddMotoCategories < ActiveRecord::Migration
  def self.up
  	['Antique/Vintage','Classic','Competition','Cruiser','Custom','Dirt Bike','Dual Sport','Mini/Pocket','Moped','MX','Scooter','Sport Touring','Sport Bike','Standard','Touring','Trike'].each do |s|
  		Motocategories.new(:category => s).save
 		end
  end

  def self.down
  	Motocategories.destroy_all
  end
end
