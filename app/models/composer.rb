class Composer < ActiveRecord::Base

	has_and_belongs_to_many :books, join_table: "composers_books"
	has_and_belongs_to_many :musics, join_table: "musics_composers"

	has_attached_file :photo, styles: { large: "900x900", medium: "200x200>", thumb: "120x120>" }, default_url: "/images/:style/missing.jpg"
		validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/


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
