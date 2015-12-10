class Composer < ActiveRecord::Base

	has_and_belongs_to_many :books, join_table: "composers_books"
	has_and_belongs_to_many :musics, join_table: "musics_composers"

	def full_name
		"#{fname} #{lname}"
	end
	
	def products
		books + musics
	end

end
