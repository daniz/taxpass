class AddOtherDescToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :other_description, :text
  end
end
