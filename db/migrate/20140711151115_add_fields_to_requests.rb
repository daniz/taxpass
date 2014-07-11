class AddFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :employed, :boolean
    add_column :requests, :spouse_employed, :boolean

    add_column :requests, :author, :boolean
    add_column :requests, :spouse_author, :boolean

    add_column :requests, :stock, :boolean
    add_column :requests, :spouse_stock, :boolean

    add_column :requests, :lottery, :boolean
    add_column :requests, :spouse_lottery, :boolean

    add_column :requests, :pension, :boolean
    add_column :requests, :spouse_pension, :boolean

    add_column :requests, :other, :boolean
    add_column :requests, :spouse_other, :boolean
  end
end
