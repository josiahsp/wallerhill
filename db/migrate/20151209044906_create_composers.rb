class CreateComposers < ActiveRecord::Migration
  def change
    create_table :composers do |t|
      t.string :fname
      t.string :lname
      t.text :bio
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
