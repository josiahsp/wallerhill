class Track < ActiveRecord::Base

	belongs_to :music
	
	validates_presence_of :title, :music_id, :length, :number, :authors
end
