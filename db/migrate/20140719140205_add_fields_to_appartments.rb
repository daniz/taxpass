class AddFieldsToAppartments < ActiveRecord::Migration
  def change
    add_column :appartments, :mortgage, :integer
    add_column :appartments, :mortgage_life_insurance, :integer
  end
end
