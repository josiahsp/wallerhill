class AddAttachmentArtworkToMusics < ActiveRecord::Migration
  def self.up
    change_table :musics do |t|
      t.attachment :artwork
    end
  end

  def self.down
    remove_attachment :musics, :artwork
  end
end
