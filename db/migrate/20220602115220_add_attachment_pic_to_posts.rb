class AddAttachmentPicToPosts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :posts do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :posts, :pic
  end
end
