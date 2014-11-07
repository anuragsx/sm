class AddModelsToAutomakes < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "Ford", :model => "AC Cobra")
  	Automodels.create(:make => "Plymouth", :model => "Scamp")
  	Automodels.create(:make => "Porsche", :model => "944")
  	Automodels.create(:make => "Porsche", :model => "968")
  	Automodels.create(:make => "Chevrolet", :model => "Corvair")
  end

  def self.down
  end
end
