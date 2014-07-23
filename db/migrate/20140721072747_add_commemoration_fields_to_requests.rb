class AddCommemorationFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :commemorate_soldier, :boolean
    add_column :requests, :commemorate_police, :boolean
    add_column :requests, :commemorate_defence, :boolean
    add_column :requests, :commemorate_victim, :boolean
    add_column :requests, :commemorate_spouse, :boolean
    add_column :requests, :commemorate_parent, :boolean
    add_column :requests, :commemorate_sibling, :boolean
    add_column :requests, :commemorate_children, :boolean
    add_column :requests, :commemorate_grandchildren, :boolean
    add_column :requests, :commemorate_parent_in_law, :boolean
    add_column :requests, :commemorate_in_law, :boolean
    add_column :requests, :commemoration_sum, :boolean
    add_column :requests, :commemoration_type, :boolean

    add_column :requests, :spouse_commemorate_soldier, :boolean
    add_column :requests, :spouse_commemorate_police, :boolean
    add_column :requests, :spouse_commemorate_defence, :boolean
    add_column :requests, :spouse_commemorate_victim, :boolean
    add_column :requests, :spouse_commemorate_spouse, :boolean
    add_column :requests, :spouse_commemorate_parent, :boolean
    add_column :requests, :spouse_commemorate_sibling, :boolean
    add_column :requests, :spouse_commemorate_children, :boolean
    add_column :requests, :spouse_commemorate_grandchildren, :boolean
    add_column :requests, :spouse_commemorate_parent_in_law, :boolean
    add_column :requests, :spouse_commemorate_in_law, :boolean
    add_column :requests, :spouse_commemoration_sum, :boolean
    add_column :requests, :spouse_commemoration_type, :boolean

  end
end
