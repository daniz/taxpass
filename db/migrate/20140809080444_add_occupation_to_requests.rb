class AddOccupationToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :occupation, :string
  end
end
