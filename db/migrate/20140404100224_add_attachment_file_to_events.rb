class AddAttachmentFileToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :events, :file
  end
end
