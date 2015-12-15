class WelcomeController < ApplicationController
	
	before_action :authenticate_user!, only: [:admin]
	before_action :verify_admin!, only: [:admin]

	def admin
		@books = Book.all.order(:pubdate)
		@music = Music.all.order(:released)
		@composers = Composer.all.order(:lname, :fname)
		@users = User.all.order(:lname)
		@admin = User.where(:admin => true).order(:lname)
	end
	
	def tracks
		@music = Music.find(params[:id])
		@tracks = @music.tracks.order(:number)
	end

end
