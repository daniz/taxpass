class RemoveSpouseFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :spouse
  end
end
