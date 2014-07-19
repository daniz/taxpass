class AddOtherFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :other_rented, :boolean
    add_column :requests, :other_sold, :boolean
    
    add_column :requests, :other_sold_appt, :boolean
    add_column :requests, :other_sold_appt_price, :integer
    add_column :requests, :other_sold_appt_agent, :integer
    add_column :requests, :other_sold_appt_legal, :integer
    add_column :requests, :other_sold_appt_tax, :integer

    add_column :requests, :other_sold_appt_abroad, :boolean
    add_column :requests, :other_sold_appt_abroad_price, :integer
    add_column :requests, :other_sold_appt_abroad_agent, :integer
    add_column :requests, :other_sold_appt_abroad_legal, :integer
    add_column :requests, :other_sold_appt_abroad_tax, :integer
    add_column :requests, :other_sold_appt_abroad_tax_o, :integer

    add_column :requests, :other_sold_o, :boolean
    add_column :requests, :other_sold_o_price, :integer
    add_column :requests, :other_sold_o_agent, :integer
    add_column :requests, :other_sold_o_legal, :integer
    add_column :requests, :other_sold_o_tax, :integer

    add_column :requests, :other_sold_o_abroad, :boolean
    add_column :requests, :other_sold_o_abroad_price, :integer
    add_column :requests, :other_sold_o_abroad_agent, :integer
    add_column :requests, :other_sold_o_abroad_legal, :integer
    add_column :requests, :other_sold_o_abroad_tax, :integer
    add_column :requests, :other_sold_o_abroad_tax_o, :integer


  end
end
