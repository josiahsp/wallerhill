module ChargesHelper

	def carttotal(cart)
		@carttotal = 0.00
		@total_items = 0
		
		items = CartItem.where(:cart_id => cart.id)
		
		items.each do |product|
			identify_product(product.product_id)
			
			@item_total = @product.price * product.quantity
			
			@total_items += product.quantity
			
			@carttotal += @item_total
		end
		@carttotal = @carttotal.to_f
		@taxrate = 0.08
		@tax = (@taxrate)*(@carttotal)
		@subtotal = (@carttotal)+(@tax)
		@shipping = (@total_items)*(300)
		@shipping = @shipping.to_f
		@final = @subtotal + @shipping
	end
end
