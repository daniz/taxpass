class AddSpousePersonalOverviewFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :spouse_birth_date, :date
    add_column :requests, :spouse_gender, :integer
    add_column :requests, :spouse_occupation, :integer
  end
end
