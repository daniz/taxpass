class AddAttachmentFileToForm857s < ActiveRecord::Migration
  def self.up
    change_table :form_857s do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :form_857s, :file
  end
end
