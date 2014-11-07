class CreateAutocategories < ActiveRecord::Migration
  def self.up
    create_table :autocategories do |t|
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :autocategories
  end
end
