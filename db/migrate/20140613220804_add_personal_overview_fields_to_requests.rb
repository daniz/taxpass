class AddPersonalOverviewFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :birth_date, :date
    add_column :requests, :gender, :integer
    add_column :requests, :occupation, :integer
  end
end
