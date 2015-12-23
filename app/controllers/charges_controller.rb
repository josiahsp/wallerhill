class ChargesController < ApplicationController

	include ChargesHelper

	def index
		@items = CartItem.where(:cart_id => @cart.id).order(:created_at)
		carttotal(@cart)
		
	end

	def new
		@items = CartItem.where(:cart_id => @cart.id).order(:created_at)
		if !current_user
			@newuser = User.new
			@newaddress = Address.new
		end
		@user_addresses = Address.where(:user => current_user)
	end

	def create
		
		if !current_user
			@newuser = User.new(user_params)
			if @newuser.save
				@newaddress = Address.new(address_params)
				@newaddress.user_id = @newuser.id
				@newaddress.save
				sign_in(:user, @newuser)
			else
				flash[:error] = @newuser.errors
				redirect_to new_charge_path
			end
			
			@cart.update_attribute("address_id", @newaddress.id)
		else
			@cart.update_attribute("address_id", params[:cart][:address_id])
		end
		
		@cart.update_attribute("status", "processed")
		@cart.update_attribute("user_id", current_user.id)
		@cart.update_attribute("placed", DateTime.now)

		@items = CartItem.where(:cart_id => @cart.id).order(:created_at)
	
		carttotal(@cart)
	
		total = @final.to_i

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => total,
	    :description => 'Waller Hill Publishing',
	    :currency    => 'usd'
	  )

	@cart = Cart.create
	         session[:cart_id] = @cart.id
	
	@total = total

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path, :total => total
	end
	private
		
		def user_params
params.require(:user).permit(:email, :password, :password_confirmation, :admin, :fname, :lname, :company)
		end
		
		def address_params
			params.require(:address).permit(:name, :company, :address1, :address2, :city, :state, :zip, :country, :phone, :user_id)
		end
end
