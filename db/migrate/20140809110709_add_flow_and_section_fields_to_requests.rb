class AddFlowAndSectionFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :flow, :string
    add_column :requests, :current_section, :string
  end
end
