class AddSpouseNameToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :spouse_name, :string
  end
end
