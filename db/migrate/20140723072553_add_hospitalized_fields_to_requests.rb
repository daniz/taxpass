class AddHospitalizedFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :hospitalized_spouse, :boolean
    add_column :requests, :hospitalized_parent, :boolean
    add_column :requests, :hospitalized_child, :boolean
    add_column :requests, :hospitalized_other, :boolean
    add_column :requests, :hospitalized_sum, :integer
    

    add_column :requests, :spouse_hospitalized_spouse, :boolean
    add_column :requests, :spouse_hospitalized_parent, :boolean
    add_column :requests, :spouse_hospitalized_child, :boolean
    add_column :requests, :spouse_hospitalized_other, :boolean
    add_column :requests, :spouse_hospitalized_sum, :integer
  end
end
