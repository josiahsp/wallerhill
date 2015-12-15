class Composer < ActiveRecord::Base

	has_and_belongs_to_many :books, join_table: "composers_books"
	has_and_belongs_to_many :musics, join_table: "musics_composers"

	validates_presence_of :lname, :bio, :city, :state
	
	def full_name
		"#{fname} #{lname}"
	end
	
	def products
		books + musics
	end

	def to_param
		"#{id}_#{full_name}"
	end
end
