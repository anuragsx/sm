class AddMarineMake < ActiveRecord::Migration
  def self.up
  	Marinemakes.create(:make => 'Formula')
  end

  def self.down
  end
end
