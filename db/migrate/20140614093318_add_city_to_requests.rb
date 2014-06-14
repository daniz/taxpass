class AddCityToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :city, :integer
  end
end
