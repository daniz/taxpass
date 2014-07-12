class RemoveParentingFieldFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :under_my_supervision, :boolean
    remove_column :requests, :single_parent, :boolean
    remove_column :requests, :supported, :boolean
  end
end
