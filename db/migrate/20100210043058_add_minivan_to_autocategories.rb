class AddMinivanToAutocategories < ActiveRecord::Migration
  def self.up
  	Autocategories.create(:category => 'Minivan')
  end

  def self.down
  end
end
