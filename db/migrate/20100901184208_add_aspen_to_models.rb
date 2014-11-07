class AddAspenToModels < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "Dodge", :model => "Aspen")
  end

  def self.down
  end
end
