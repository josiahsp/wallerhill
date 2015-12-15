class Music < ActiveRecord::Base

	has_and_belongs_to_many :composers, join_table: "musics_composers"
	has_many :tracks
	
	validates_presence_of :title, :description, :released
	validates_uniqueness_of :title

	def to_param
		"#{id}_#{title}"
	end
end
