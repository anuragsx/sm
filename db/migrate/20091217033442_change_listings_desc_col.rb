class ChangeListingsDescCol < ActiveRecord::Migration
  def self.up
  	change_column :listings, :desc, :text
  end

  def self.down
  	
  end
end
