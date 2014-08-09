class RemoveOccupationFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :occupation
  end
end
