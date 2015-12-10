class AddParamsToBooksCorrection < ActiveRecord::Migration
  def change
	add_column :books, :title, :string
	add_column :books, :description, :text
	add_column :books, :pubdate, :date
	add_column :books, :isbn, :integer
	add_column :books, :stock, :integer
	add_column :books, :can_order, :boolean
  end
end
