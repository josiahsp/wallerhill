class ChargesController < ApplicationController

	include ChargesHelper

	def new
		@items = CartItem.where(:cart_id => @cart.id).order(:created_at)
	end

	def create

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @final,
	    :description => 'Waller Hill Publishing',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

end
