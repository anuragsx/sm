class CreateMotomakes < ActiveRecord::Migration
  def self.up
  	create_table :motomakes do |t|
      t.string :make

      t.timestamps
    end
  end

  def self.down
  	drop_table :motomakes
  end
end
