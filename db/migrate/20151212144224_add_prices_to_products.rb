class AddPricesToProducts < ActiveRecord::Migration
  def change
	add_column :books, :price, :int
	add_column :musics, :price, :int
	add_column :tracks, :price, :int
  end
end
