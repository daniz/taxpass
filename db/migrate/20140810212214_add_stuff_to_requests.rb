class AddStuffToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :phone_number, :string
    add_column :requests, :feedback, :text
    add_column :requests, :include_spouse, :boolean
    add_column :requests, :stock_manual, :boolean
  end
end
