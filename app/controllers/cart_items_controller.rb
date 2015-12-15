class CartItemsController < ApplicationController

	def create
		@item = CartItem.new(cart_item_params)
		
		@existing = CartItem.where(:cart_id => @cart).where(:product_id => @item.product_id).first
		
		if @existing
			@existing.quantity += 1
			if @existing.update({:quantity => @existing.quantity})
				redirect_to new_charge_path
			else
				flash[:alert] = "An error has occured. Please try adding the item again. If the issue persists, please notify us at wallerhillpublishing@gmail.com"
				redirect_to(:back)
			end
		else
			if @item.save
				redirect_to new_charge_path
			else
				flash[:alert] = "An error has occured. Please try adding the item again. If the issue persists, please notify us at wallerhillpublishing@gmail.com"
				redirect_to(:back)
			end
		end
	end
	
	def update
		@item = CartItem.find(params[:id])
		@item.update(update_quantity_params)
		redirect_to new_charge_path
	end
	
	def destroy
		@item = CartItem.find(params[:id])
		@item.destroy
		
		redirect_to new_charge_path
	end

	private
	
		def cart_item_params
			params.require(:item).permit(:cart_id, :product_id, :quantity)
		end
	
		def update_quantity_params
			params.permit(:cart_id, :product_id, :quantity)
		end
end
