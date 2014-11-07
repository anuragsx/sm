class AddValiantToAutomakes < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "Plymouth", :model => "Valiant")
  end

  def self.down
  end
end
