class AddRx7ToAutomodels < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "Mazda", :model => "RX-7")
  end

  def self.down
  	Automodels.destroy(:make => "Mazda", :model => "RX-7")
  end
end
