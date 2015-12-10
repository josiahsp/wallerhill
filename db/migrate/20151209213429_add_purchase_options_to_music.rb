class AddPurchaseOptionsToMusic < ActiveRecord::Migration
  def change
	add_column :musics, :barcode, :string
	add_column :musics, :stock, :integer
	add_column :musics, :can_order, :boolean
  end
end
