class AddAttachmentFileToBtlForms < ActiveRecord::Migration
  def self.up
    change_table :btl_forms do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :btl_forms, :file
  end
end
