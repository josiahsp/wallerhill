class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

	before_action :cart

	def cart 
	    @cart = Cart.find(session[:cart_id])
	    rescue ActiveRecord::RecordNotFound
	         @cart = Cart.create
			 @cart.update_attribute("status", "open")
	         session[:cart_id] = @cart.id
	end

	private
	
		def verify_admin!
			if current_user.admin
				return
			else
				flash[:alert] = 'You do not have administrative access. If you believe this is in error, please contact a web administrator.'
				redirect_to root_path
			end
		end
	
	

end
