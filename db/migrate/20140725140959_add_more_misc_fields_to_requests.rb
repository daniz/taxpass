class AddMoreMiscFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :btl_sum, :integer
    add_column :requests, :spouse_btl_sum, :integer
    add_column :requests, :insurance_sum, :integer
    add_column :requests, :spouse_insurance_sum, :integer
    add_column :requests, :expense_pension_sum, :integer
    add_column :requests, :spouse_expense_pension_sum, :integer
    add_column :requests, :expense_pension_employed_sum, :integer
    add_column :requests, :spouse_expense_pension_employed_sum, :integer
  end
end
