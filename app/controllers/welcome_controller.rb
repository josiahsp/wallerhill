class WelcomeController < ApplicationController
	
	before_action :authenticate_user!, only: [:admin]

	def admin
		@books = Book.all.order(:pubdate)
		@music = Music.all.order(:released)
		@composers = Composer.all.order(:lname)
		@users = User.all.order(:email)
	end

end
