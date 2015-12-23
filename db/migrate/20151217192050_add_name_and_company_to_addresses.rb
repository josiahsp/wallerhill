class AddNameAndCompanyToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :name, :string
    add_column :addresses, :company, :string
  end
end
