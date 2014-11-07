class CreateMarinemakes < ActiveRecord::Migration
  def self.up
  	create_table :marinemakes do |t|
      t.string :make

      t.timestamps
    end
  end

  def self.down
  	drop table :marinemakes
  end
end
