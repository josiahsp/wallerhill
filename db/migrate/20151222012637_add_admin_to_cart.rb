class AddAdminToCart < ActiveRecord::Migration
  def change
    add_column :carts, :admin, :integer
  end
end
