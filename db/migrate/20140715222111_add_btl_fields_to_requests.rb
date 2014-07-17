class AddBtlFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :btl, :boolean
    add_column :requests, :spouse_btl, :boolean
  end
end
