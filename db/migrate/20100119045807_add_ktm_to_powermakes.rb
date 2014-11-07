class AddKtmToPowermakes < ActiveRecord::Migration
  def self.up
  	Powermakes.create(:make => 'KTM')
  end

  def self.down
  	Powermakes.destroy(:make => 'KTM')
  end
end
