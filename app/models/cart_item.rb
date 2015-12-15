class CartItem < ActiveRecord::Base

	has_many :products
	belongs_to :cart

end
