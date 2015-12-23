module WelcomeHelper

	def cartitems(cart)
		items = CartItem.where(:cart_id => cart.id).order(:created_at)
	end
	
	def item_count(cart)
		items = CartItem.where(:cart_id => cart.id)
		
		count = 0
		items.each do |i|
			count += i.quantity
		end
		
		return count
	end
	
	def admin_initials(order)
		admin = User.find(order.admin)
		
		return admin.fname[0,1].titleize + admin.lname[0,1].titleize
	end

end
