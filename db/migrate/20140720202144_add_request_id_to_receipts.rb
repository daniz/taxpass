class AddRequestIdToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :request_id, :integer
  end
end
