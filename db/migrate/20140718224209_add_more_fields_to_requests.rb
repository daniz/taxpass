class AddMoreFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :income_abroad_interest, :integer
    add_column :requests, :income_abroad_dividend, :integer
    add_column :requests, :income_abroad_capital_profit, :integer
    add_column :requests, :income_abroad_capital_loss, :integer
    add_column :requests, :income_abroad_tax, :integer
  end
end
