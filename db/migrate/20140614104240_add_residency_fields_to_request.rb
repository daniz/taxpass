class AddResidencyFieldsToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :israeli_resident, :boolean
    add_column :requests, :spouse_israeli_resident, :string
  end
end
