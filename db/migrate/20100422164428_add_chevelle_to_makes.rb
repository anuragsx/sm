class AddChevelleToMakes < ActiveRecord::Migration
  def self.up
  	Automodels.create(:make => "Chevrolet", :model => "Chevelle")
  end

  def self.down
  end
end
