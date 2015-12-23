class AddFinaltotalToCart < ActiveRecord::Migration
  def change
    add_column :carts, :finaltotal, :integer
    add_column :carts, :placed, :datetime
    add_column :carts, :shipped, :datetime
  end
end
