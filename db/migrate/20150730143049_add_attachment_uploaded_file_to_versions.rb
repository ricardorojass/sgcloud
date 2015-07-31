class AddAttachmentUploadedFileToVersions < ActiveRecord::Migration
  def self.up
    change_table :versions do |t|
      t.attachment :uploaded_file
    end
  end

  def self.down
    remove_attachment :versions, :uploaded_file
  end
end
