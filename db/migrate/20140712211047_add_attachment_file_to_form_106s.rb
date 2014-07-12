class AddAttachmentFileToForm106s < ActiveRecord::Migration
  def self.up
    change_table :form_106s do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :form_106s, :file
  end
end
