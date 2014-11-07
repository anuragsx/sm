class MessageObserver < ActiveRecord::Observer
	def after_create(message)
		if message.recipient_id == 1
			Automailer.deliver_contact_us_message(message)
		else
			Automailer.deliver_new_message(message)
		end
	end
end
