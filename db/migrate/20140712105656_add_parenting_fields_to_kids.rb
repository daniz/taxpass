class AddParentingFieldsToKids < ActiveRecord::Migration
  def change
    add_column :kids, :under_my_supervision, :boolean
    add_column :kids, :single_parent, :boolean
    add_column :kids, :supported, :boolean
  end
end
