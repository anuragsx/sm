class UserObserver < ActiveRecord::Observer
	def after_create(user)
		Automailer.deliver_welcome_email(user)
	end
end
