class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.string :fname
      t.string :lname
      t.text :bio
      t.string :city
      t.string :state
      t.boolean :digital
      t.boolean :physical
      t.string :itunes

      t.timestamps null: false
    end
  end
end
