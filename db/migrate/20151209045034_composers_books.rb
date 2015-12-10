class ComposersBooks < ActiveRecord::Migration
  def change
	create_table :composers_books, :id => false do |t|
		t.integer :book_id
		t.integer :composer_id
	end
  end
end
