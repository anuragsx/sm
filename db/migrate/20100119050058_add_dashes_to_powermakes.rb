class AddDashesToPowermakes < ActiveRecord::Migration
  def self.up
  	Powermakes.create(:make => '-----------------------', :sort_order => 110)
    #Powermakes.create(:make => '-----------------------')
  end

  def self.down
  end
end
