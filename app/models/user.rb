class User < ActiveRecord::Base

  attr_accessible :email, :firstname, :lastname, :phone, :address, :address2, :city, :state, :zip, :username, :password,
                  :password_confirmation, :referred_by

	validates :firstname, :lastname, :phone, :address, :city, :state, :zip, :referred_by, :presence => true
	validates :zip, :length => { :in => 5..6 }

#can't make zip all numeric any more since Canadian Postal Codes are alphanumeric
	#validates_numericality_of :zip, :only_integer => true
	
	has_many :listings, :dependent => :destroy
	has_many :messages
	has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id", :conditions => ['sender_deleted_at IS NULL'], :order => "created_at DESC"
	has_many :received_messages, :class_name => "Message", :foreign_key => "recipient_id", :conditions => ['recipient_deleted_at IS NULL'], :order => "created_at DESC"
	has_many :unread_messages, :class_name => "Message", :foreign_key => "recipient_id", :conditions => ['read_at IS NULL AND recipient_deleted_at IS NULL'], :order => "created_at DESC"
	has_many :wishlists
	has_many :favorites
	#has_many :favorite_listings, :through => :favorites, :source => :listing
	acts_as_authentic
	
def deliver_password_reset_instructions!
	reset_perishable_token!
	Automailer.deliver_password_reset_instructions(self)
end

end
