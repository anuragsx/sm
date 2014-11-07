class AdditionalModelsToAutomodels < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "Chevrolet", :model => "C-10")
  	Automodels.create(:make => "Ford", :model => "Custom")
  	Automodels.create(:make => "Chevrolet", :model => "El Camino")
  	Automodels.create(:make => "Shelby", :model => "Cobra")
  	Automodels.create(:make => "Chevrolet", :model => "Panel Truck")
  	Automodels.create(:make => "Ford", :model => "Panel Truck")
  	Automodels.create(:make => "Chevrolet", :model => "BelAir")
  	Automodels.create(:make => "Nissan", :model => "300Z")
  end

  def self.down
  end
end
