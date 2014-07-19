class AddAppartmentToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :appartment, :boolean
    add_column :requests, :spouse_appartment, :boolean
  end
end
