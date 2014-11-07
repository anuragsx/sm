class Message < ActiveRecord::Base

  attr_accessible :recipient_id, :name, :email, :phone, :subject, :body, :sender_id, :listing_id

	validates :recipient_id, :subject, :body, :presence => true
	belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
	belongs_to :recipient, :class_name => "User", :foreign_key => "recipient_id"
	belongs_to :listing
end
