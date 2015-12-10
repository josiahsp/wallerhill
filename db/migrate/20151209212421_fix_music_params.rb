class FixMusicParams < ActiveRecord::Migration
  def change
	add_column :musics, :description, :text
	remove_column :musics, :fname
	remove_column :musics, :lname
	remove_column :musics, :bio
	remove_column :musics, :city
	remove_column :musics, :state
  end
end
