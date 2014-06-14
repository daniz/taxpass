class AddPersonalInfoToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :is_single, :boolean
    add_column :requests, :is_married, :boolean
    add_column :requests, :is_widowed, :boolean
    add_column :requests, :is_divorced, :boolean
    add_column :requests, :is_seperated, :boolean
    add_column :requests, :is_coupled, :boolean
    add_column :requests, :is_same_sex_married, :boolean
  end
end
