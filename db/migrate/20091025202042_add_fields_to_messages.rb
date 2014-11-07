class AddFieldsToMessages < ActiveRecord::Migration
  def self.up
  	add_column :messages, :name, :string
  	add_column :messages, :email, :string
  	add_column :messages, :phone, :string
  end

  def self.down
  	remove_column :messages, :name
  	remove_column :messages, :email
  	remove_column :messages, :phone
  end
end
