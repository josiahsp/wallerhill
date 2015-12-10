class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :length
      t.string :artist
      t.integer :number
      t.string :isrc
      t.references :music
      t.integer :ccli
      t.string :authors

      t.timestamps null: false
    end
  end
end
