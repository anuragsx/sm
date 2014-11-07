class AddMarinemakes < ActiveRecord::Migration
  def self.up
  	Marinemakes.create(:make => "Sea Pro")
  	Marinemakes.create(:make => "Hydro Sport")
  	Marinemakes.create(:make => "Regal")
  	Marinemakes.create(:make => "Bomber")
  	Marinemakes.create(:make => "Cobra")
  	Marinemakes.create(:make => "Chapparal")
  	Marinemakes.create(:make => "Proline")
  	Marinemakes.create(:make => "Gambler")
  end

  def self.down
  end
end
