class AddTaxYearToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :tax_year, :integer
  end
end
