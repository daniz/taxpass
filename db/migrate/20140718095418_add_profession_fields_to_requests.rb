class AddProfessionFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :profession, :string
    add_column :requests, :spouse_profession, :string
  end
end
