class RemoveAttachmentFromForm857s < ActiveRecord::Migration
  def change
    remove_attachment :form_857s, :file
    remove_attachment :form_867s, :file
    remove_attachment :btl_forms, :file
  end
end
