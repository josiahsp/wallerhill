class ChangeCartItemProductIdToBigInt < ActiveRecord::Migration
  def up
	change_column :cart_items, :product_id, :bigint
  end
  def down
	change_column :cart_items, :product_id, :integer
  end
end
