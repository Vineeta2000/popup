class AddAttachmentPictureToPhotos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :photos do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :photos, :picture
  end
end
