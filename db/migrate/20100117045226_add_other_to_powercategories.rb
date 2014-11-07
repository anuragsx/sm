class AddOtherToPowercategories < ActiveRecord::Migration
  def self.up
  	Powercategories.create(:category => 'ATV', :subcategory => 'Other')
  	Powercategories.create(:category => 'Snowmobile', :subcategory => 'Other')
  end

  def self.down
  	Powercategories.destroy(:category => 'ATV', :subcategory => 'Other')
  	Powercategories.destroy(:category => 'Snowmobile', :subcategory => 'Other')
  end
end
