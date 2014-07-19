class AddExpenseFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :public_donation, :boolean
    add_column :requests, :commemoration, :boolean
    add_column :requests, :hospitalized_family, :boolean
    add_column :requests, :professional_literature, :boolean
    add_column :requests, :professional_course, :boolean
    add_column :requests, :cpa_expense, :boolean
    add_column :requests, :btl_expense, :boolean
    add_column :requests, :insurance_expense, :boolean
    add_column :requests, :pension_plan, :boolean

    add_column :requests, :spouse_public_donation, :boolean
    add_column :requests, :spouse_commemoration, :boolean
    add_column :requests, :spouse_hospitalized_family, :boolean
    add_column :requests, :spouse_professional_literature, :boolean
    add_column :requests, :spouse_professional_course, :boolean
    add_column :requests, :spouse_cpa_expense, :boolean
    add_column :requests, :spouse_btl_expense, :boolean
    add_column :requests, :spouse_insurance_expense, :boolean
    add_column :requests, :spouse_pension_plan, :boolean
  end
end
