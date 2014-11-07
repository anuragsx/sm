class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :price
      t.string :active
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
