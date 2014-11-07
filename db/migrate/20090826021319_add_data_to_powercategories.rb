class AddDataToPowercategories < ActiveRecord::Migration
  def self.up
  	Powercategories.create(:category => 'ATV', :subcategory => 'Dune Buggy')
		Powercategories.create(:category => 'ATV', :subcategory => 'Four-Wheeler')
		Powercategories.create(:category => 'ATV', :subcategory => 'Golf Cart')
		Powercategories.create(:category => 'ATV', :subcategory => 'Sand Rail')
		Powercategories.create(:category => 'ATV', :subcategory => 'Six-Wheeler')
		Powercategories.create(:category => 'ATV', :subcategory => 'Three-Wheeler')
		Powercategories.create(:category => 'ATV', :subcategory => 'Work/Utility')
		Powercategories.create(:category => 'Snowmobile', :subcategory => 'Arctic Cat')
		Powercategories.create(:category => 'Snowmobile', :subcategory => 'Blade')
		Powercategories.create(:category => 'Snowmobile', :subcategory => 'Polaris')
		Powercategories.create(:category => 'Snowmobile', :subcategory => 'Roketa')
		Powercategories.create(:category => 'Snowmobile', :subcategory => 'Ski-Doo')
		Powercategories.create(:category => 'Snowmobile', :subcategory => 'Terminator')
		Powercategories.create(:category => 'Snowmobile', :subcategory => 'Yamaha')  end

  def self.down
  	Powercategories.destroy_all
  end
end
