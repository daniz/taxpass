class AddAcademiaFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :academia_graduation_date, :date
    add_column :requests, :spouse_academia_graduation_date, :date
    add_column :requests, :academia_institution, :integer
    add_column :requests, :spouse_academia_institution, :integer
    add_column :requests, :academia_degree, :integer
    add_column :requests, :spouse_academia_degree, :integer
    add_column :requests, :academia_years, :integer
    add_column :requests, :spouse_academia_years, :integer
  end
end
