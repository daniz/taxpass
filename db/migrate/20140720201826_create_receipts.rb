class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :kind
      t.integer :index
    end
  end
end
