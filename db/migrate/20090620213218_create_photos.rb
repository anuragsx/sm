class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :name
      t.string :image_file
      t.string :image_filename
      t.integer :image_width
      t.integer :image_height
      t.references :listing

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
