class ChangeBookIsbnToString < ActiveRecord::Migration
  def change
	def up
	    change_column :books, :isbn, :string
	  end

	  def down
	    change_column :books, :isbn, :integer
	  end
  end
end
