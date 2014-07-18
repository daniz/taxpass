class AddAttachmentFileToPensionForms < ActiveRecord::Migration
  def self.up
    change_table :pension_forms do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :pension_forms, :file
  end
end
