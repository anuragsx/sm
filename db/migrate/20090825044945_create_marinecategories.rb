class CreateMarinecategories < ActiveRecord::Migration
  def self.up
		create_table :marinecategories do |t|
      t.string :category
      t.string :subcategory

      t.timestamps
    end
  end

  def self.down
  	drop_table :marinecategories
  end
end
