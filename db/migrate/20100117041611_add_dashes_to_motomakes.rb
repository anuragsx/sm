class AddDashesToMotomakes < ActiveRecord::Migration
  def self.up
  	Motomakes.create(:make => '---------------------------', :sort_order => 990)
    #Motomakes.create(:make => '---------------------------')
  end

  def self.down
	  Motomakes.destroy(:make => '---------------------------', :sort_order => 990)
    #Motomakes.destroy(:make => '---------------------------')
  end
end
