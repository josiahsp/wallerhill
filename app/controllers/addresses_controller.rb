class AddressesController < ApplicationController
	
	before_action :authenticate_user!
	
	def index
		@addresses = Address.where(:user_id => current_user)
	end
	
	def new
		@address = Address.new
	end
	
	def create
		@address = Address.new(address_params)
		if @address.save
			flash[:success] = 'Address Saved'
			redirect_to new_charge_path
		else
			flash[:alert] = 'An error occured. Please try again.'
			render :new
		end
	end
	
	def edit
		@address = Address.find(params[:id])
	end
	
	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
			flash[:success] = 'Address Updated'
			redirect_to addresses_path
		else
			flash[:error] = @address.errors
			render :edit
		end
	end

	def show
	
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		
		redirect_to addresses_path
	end

	private
	
	def address_params
		params.require(:address).permit(:name, :company, :address1, :address2, :city, :state, :zip, :country, :phone, :user_id)
	end
end
