class RemoveAddressColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :address1
    remove_column :users, :address2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
    remove_column :users, :phone
  end
end
