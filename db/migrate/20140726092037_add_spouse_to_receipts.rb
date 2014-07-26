class AddSpouseToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :spouse, :boolean
  end
end
