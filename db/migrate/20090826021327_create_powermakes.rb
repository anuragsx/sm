class CreatePowermakes < ActiveRecord::Migration
  def self.up
  	create_table :powermakes do |t|
      t.string :make

      t.timestamps
    end
  end

  def self.down
  	drop_table :powermakes
  end
end
