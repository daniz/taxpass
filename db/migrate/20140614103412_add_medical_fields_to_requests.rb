class AddMedicalFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :blind, :boolean
    add_column :requests, :disabled, :boolean
  end
end
