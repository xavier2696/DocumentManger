class AddAttachmentPictureToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :documents, :picture
  end
end
