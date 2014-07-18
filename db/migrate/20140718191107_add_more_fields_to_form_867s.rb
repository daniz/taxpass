class AddMoreFieldsToForm867s < ActiveRecord::Migration
  def change
    add_column :form_867s, :pre_deduction_dividend_0, :integer
    add_column :form_867s, :pre_deduction_dividend_15, :integer
    add_column :form_867s, :pre_deduction_dividend_20, :integer
    add_column :form_867s, :pre_deduction_dividend_25, :integer

    add_column :form_867s, :dividend_income_abroad_0, :integer
    add_column :form_867s, :dividend_income_abroad_15, :integer
    add_column :form_867s, :dividend_income_abroad_20, :integer
    add_column :form_867s, :dividend_income_abroad_25, :integer

    add_column :form_867s, :exempt_profit_0, :integer
    add_column :form_867s, :exempt_profit_15, :integer
    add_column :form_867s, :exempt_profit_20, :integer
    add_column :form_867s, :exempt_profit_25, :integer

    add_column :form_867s, :tax_abroad_0, :integer
    add_column :form_867s, :tax_abroad_15, :integer
    add_column :form_867s, :tax_abroad_20, :integer
    add_column :form_867s, :tax_abroad_25, :integer

    add_column :form_867s, :pre_deduction_interest_profit_0, :integer
    add_column :form_867s, :pre_deduction_interest_profit_10, :integer
    add_column :form_867s, :pre_deduction_interest_profit_15, :integer
    add_column :form_867s, :pre_deduction_interest_profit_20, :integer
    add_column :form_867s, :pre_deduction_interest_profit_25, :integer
    add_column :form_867s, :pre_deduction_interest_profit_35, :integer

    add_column :form_867s, :interest_profit_abroad_0, :integer
    add_column :form_867s, :interest_profit_abroad_10, :integer
    add_column :form_867s, :interest_profit_abroad_15, :integer
    add_column :form_867s, :interest_profit_abroad_20, :integer
    add_column :form_867s, :interest_profit_abroad_25, :integer
    add_column :form_867s, :interest_profit_abroad_35, :integer

    add_column :form_867s, :interest_exempt_profit_0, :integer
    add_column :form_867s, :interest_exempt_profit_10, :integer
    add_column :form_867s, :interest_exempt_profit_15, :integer
    add_column :form_867s, :interest_exempt_profit_20, :integer
    add_column :form_867s, :interest_exempt_profit_25, :integer
    add_column :form_867s, :interest_exempt_profit_35, :integer

    add_column :form_867s, :dividend_tax, :integer    
    add_column :form_867s, :interest_tax, :integer    
  end
end
