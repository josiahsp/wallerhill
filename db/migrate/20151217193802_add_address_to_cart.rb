class AddAddressToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :address, index: true, foreign_key: true
  end
end
