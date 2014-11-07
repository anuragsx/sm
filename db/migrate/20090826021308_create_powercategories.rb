class CreatePowercategories < ActiveRecord::Migration
  def self.up
  	create_table :powercategories do |t|
      t.string :category
      t.string :subcategory

      t.timestamps
    end
  end

  def self.down
  	drop_table :powercategories
  end
end
