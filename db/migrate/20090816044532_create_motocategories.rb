class CreateMotocategories < ActiveRecord::Migration
  def self.up
    create_table :motocategories do |t|
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :motocategories
  end
end
