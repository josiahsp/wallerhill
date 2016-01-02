class OrderMailer < ActionMailer::Base
	helper :Application
	helper :Charges
	
	layout 'email'

	def receipt(user, cart, items)
		@user = user
		@cart = cart
		@items = items
		mail(to: user.email,
			from: "wallerhillpublishing@gmail.com",
			subject: "Your Receipt from Waller-Hill",
			content_type: "text/html"
			)
	end
	
	def orderNotification(user, cart, items)
		@user = user
		@cart = cart
		@items = items
		mail(to: "wallerhillpublishing@gmail.com",
			from: "wallerhillpublishing@gmail.com",
			subject: "New Order at Waller-Hill",
			content_type: "text/html"
			)
	end

end