class RemoveAttachmentFromPensionForms < ActiveRecord::Migration
  def change
    remove_attachment :pension_forms, :file
  end
end
