class CreateAutomodels < ActiveRecord::Migration
  def self.up
    create_table :automodels do |t|
      t.string :make
      t.string :model

      t.timestamps
    end
  end

  def self.down
    drop_table :automodels
  end
end
