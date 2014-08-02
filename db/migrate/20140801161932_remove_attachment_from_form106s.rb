class RemoveAttachmentFromForm106s < ActiveRecord::Migration
  def change
    remove_attachment :form_106s, :file
  end
end
