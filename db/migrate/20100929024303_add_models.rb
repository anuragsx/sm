class AddModels < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "MG", :model => "MGA")
  	Automodels.create(:make => "MG", :model => "MGB")
  	Automodels.create(:make => "MG", :model => "MGC")
  	Automodels.create(:make => "MG", :model => "MGBGT")
  end

  def self.down
  end
end
