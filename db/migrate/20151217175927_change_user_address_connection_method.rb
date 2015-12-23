class ChangeUserAddressConnectionMethod < ActiveRecord::Migration
  def change
    remove_column :addresses, :user_id
    add_reference :addresses, :user
  end
end
