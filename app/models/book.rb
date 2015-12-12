class Book < ActiveRecord::Base

	has_and_belongs_to_many :composers, join_table: "composers_books"

	def to_param
		"#{id}_#{title}"
	end

end
