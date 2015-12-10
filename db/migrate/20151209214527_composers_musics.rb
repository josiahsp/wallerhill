class ComposersMusics < ActiveRecord::Migration
  def change
	create_table :musics_composers, :id => false do |t|
	  t.integer :composer_id
	  t.integer :music_id
	end
  end
end
