class AddTaxStatusFieldsToRequests2 < ActiveRecord::Migration
  def change
    add_column :requests, :retired, :boolean
    add_column :requests, :spouse_retired, :boolean
    add_column :requests, :immigrant, :boolean
    add_column :requests, :spouse_immigrant, :boolean
    add_column :requests, :immigration_date, :date
    add_column :requests, :spouse_immigration_date, :date
    add_column :requests, :idf_service, :boolean
    add_column :requests, :spouse_idf_service, :boolean
    add_column :requests, :idf_discharge_date, :date
    add_column :requests, :spouse_idf_discharge_date, :date
    add_column :requests, :idf_service_duration, :integer
    add_column :requests, :spouse_idf_service_duration, :integer
    add_column :requests, :academic, :boolean
    add_column :requests, :spouse_academic, :boolean
    add_column :requests, :special_area_resident, :boolean
    add_column :requests, :spouse_special_area_resident, :boolean
  end
end
