class AddMakesToPowermakes < ActiveRecord::Migration
  def self.up
  	Powermakes.create(:make => 'Blade', :sort_order => 7)
  	Powermakes.create(:make => 'Ski-Doo', :sort_order => 87)
  	Powermakes.create(:make => 'Terminator', :sort_order => 95)
=begin
    Powermakes.create(:make => 'Blade')
    Powermakes.create(:make => 'Ski-Doo')
    Powermakes.create(:make => 'Terminator')
=end
  end

  def self.down
  end
end
