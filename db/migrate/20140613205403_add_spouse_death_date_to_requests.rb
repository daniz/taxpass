class AddSpouseDeathDateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :death_date, :date
  end
end
