class AddWorkplaceToForm106s < ActiveRecord::Migration
  def change
    add_column :form_106s, :workplace, :string
  end
end
