module BooksHelper

	def book_params
		params.require(:book).permit(:title, :description, :isbn, :pubdate, :stock, :can_order, :composer_ids => [])
	end
	
	def stock_check(product)
		if product.stock >= 1
			return "In stock"
		else
			return "Not in stock"
		end
	end

end
