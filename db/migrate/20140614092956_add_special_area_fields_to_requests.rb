class AddSpecialAreaFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :lived_with_spouse_throughout, :boolean
    add_column :requests, :special_area_residency_start_date, :date
    add_column :requests, :special_area_residency_end_date, :date
  end
end