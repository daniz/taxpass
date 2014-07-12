class AddParentingFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :under_my_supervision, :boolean
    add_column :requests, :single_parent, :boolean
    add_column :requests, :supported, :boolean
  end
end
