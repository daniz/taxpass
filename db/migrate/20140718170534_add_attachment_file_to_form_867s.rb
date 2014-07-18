class AddAttachmentFileToForm867s < ActiveRecord::Migration
  def self.up
    change_table :form_867s do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :form_867s, :file
  end
end
