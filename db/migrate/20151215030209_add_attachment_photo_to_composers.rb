class AddAttachmentPhotoToComposers < ActiveRecord::Migration
  def self.up
    change_table :composers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :composers, :photo
  end
end
