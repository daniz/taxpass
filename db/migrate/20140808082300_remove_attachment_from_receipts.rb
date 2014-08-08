class RemoveAttachmentFromReceipts < ActiveRecord::Migration
  def change
    remove_attachment :receipts, :file
  end
end
