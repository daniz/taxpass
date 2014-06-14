class AddSpouseMedicalFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :spouse_blind, :boolean
    add_column :requests, :spouse_disabled, :boolean
  end
end