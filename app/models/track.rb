class Track < ActiveRecord::Base

	belongs_to :music
	
	validates_presence_of :title, :album, :length, :number, :authors
	validates_uniqueness_of :ccli
	
end
