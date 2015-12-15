class Book < ActiveRecord::Base

	has_and_belongs_to_many :composers, join_table: "composers_books"
	
	validates_presence_of :title, :description, :isbn, :pubdate, :stock, :can_order
	validates_uniqueness_of :title, :isbn

	has_attached_file :cover, styles: { large: "1350x900", medium: "270x180>", thumb: "180x120>" }, default_url: "/images/:style/missing.jpg"
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

end
