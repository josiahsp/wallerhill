class Book < ActiveRecord::Base

	has_and_belongs_to_many :composers, join_table: "composers_books"
	
	validates_presence_of :title, :description, :isbn, :pubdate, :stock, :can_order
	validates_uniqueness_of :title, :isbn

	def to_param
		"#{id}_#{title}"
	end

end
