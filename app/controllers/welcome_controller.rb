class WelcomeController < ApplicationController
	
	before_action :authenticate_user!, only: [:admin, :address_book, :orders, :admin_orders, :admin_edit_user, :user_destroy, :admin_user_update, :tracks]
	before_action :verify_admin!, only: [:admin, :admin_orders, :admin_edit_user, :user_destroy, :admin_user_update, :tracks]
	
	def address_book
		@user = User.find(params[:id])
		@addresses = Address.where(:user_id => params[:id])
	end

	def admin
		@books = Book.all.order(:pubdate)
		@music = Music.all.order(:released)
		@composers = Composer.all.order(:lname, :fname)
		@users = User.all.order(:lname)
		@admin = User.where(:admin => true).order(:lname)
	end
	
	def admin_orders
		@open = Cart.where(:status => 'open').limit(50).order("created_at DESC")
		@orders = Cart.where(:status => 'processed').order("shipped ASC")
		@filled = Cart.where(:status => 'shipped').limit(50).order("shipped DESC")
	end
	
	def orders
		@orders = Cart.where(:user_id => current_user.id).order("placed DESC")
	end
	
	def admin_view_order
		@order = Cart.find(params[:id])
	end
	
	def ship_order
		@order = Cart.find(params[:id])
		@order.update_attribute("shipped", DateTime.now)
		@order.update_attribute("status", 'shipped')
		@order.update_attribute("admin", current_user.id)
		
		redirect_to admin_orders_path
	end
	
	def admin_edit_user
		@selected_user = User.find(params[:id])
	end
	
	def user_destroy
		@selected_user = User.find(params[:id])
		@selected_user.delete
		@useraddresses = Address.where(:user_id => @selected_user.id)
		@useraddresses.delete
		redirect_to admin_path
	end
	
	def admin_user_update
		@selected_user = User.find(params[:id])
		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end
		if @selected_user.update(selected_user_params)
			flash[:success] = "User successfully updated"
			redirect_to admin_path
		else
			flash[:error] = @selected_user.errors
			render :admin_edit_user
		end
	end
	
	def tracks
		@music = Music.find(params[:id])
		@tracks = @music.tracks.order(:number)
	end
	
	def user_profile
		@user = User.find(params[:id])
		@orders = Cart.where(:user_id => @user.id).where(:status != "open" && :status != nil)
	end
	private
	
		def selected_user_params
			params.require(:user).permit(:fname, :lname, :company, :email, :password, :password_confirmation, :admin)
		end

end
