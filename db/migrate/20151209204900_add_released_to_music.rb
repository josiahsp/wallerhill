class AddReleasedToMusic < ActiveRecord::Migration
  def change
	add_column :musics, :released, :date
  end
end
