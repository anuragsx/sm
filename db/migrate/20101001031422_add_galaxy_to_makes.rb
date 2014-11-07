class AddGalaxyToMakes < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "Ford", :model => "Galaxy")
  end

  def self.down
  end
end
