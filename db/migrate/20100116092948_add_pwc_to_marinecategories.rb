class AddPwcToMarinecategories < ActiveRecord::Migration
  def self.up
  	Marinecategories.create(:category => 'Personal Watercraft', :subcategory => 'Solo')
  	Marinecategories.create(:category => 'Personal Watercraft', :subcategory => 'Sport')
  	Marinecategories.create(:category => 'Personal Watercraft', :subcategory => 'Two Seater')
  	Marinecategories.create(:category => 'Personal Watercraft', :subcategory => 'Four Seater')
  end

  def self.down
  	Marinecategories.destroy(:category => 'Personal Watercraft', :subcategory => 'Solo')
  	Marinecategories.destroy(:category => 'Personal Watercraft', :subcategory => 'Sport')
  	Marinecategories.destroy(:category => 'Personal Watercraft', :subcategory => 'Two Seater')
  	Marinecategories.destroy(:category => 'Personal Watercraft', :subcategory => 'Four Seater')
  end
end
