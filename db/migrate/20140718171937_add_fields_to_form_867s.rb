class AddFieldsToForm867s < ActiveRecord::Migration
  def change
    add_column :form_867s, :pre_deduction_profit_0, :integer
    add_column :form_867s, :pre_deduction_profit_10, :integer
    add_column :form_867s, :pre_deduction_profit_20, :integer
    add_column :form_867s, :pre_deduction_profit_25, :integer
    add_column :form_867s, :pre_deduction_profit_30, :integer
    add_column :form_867s, :pre_deduction_profit_35, :integer
    add_column :form_867s, :deductable_losses, :integer
    add_column :form_867s, :undeductable_losses, :integer
    add_column :form_867s, :field_56_256, :integer
    add_column :form_867s, :field_40, :integer
  end
end
