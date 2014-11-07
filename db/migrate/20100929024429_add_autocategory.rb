class AddAutocategory < ActiveRecord::Migration
  def self.up
	  Autocategories.create(:category => "Panel Van")
  end

  def self.down
  end
end
