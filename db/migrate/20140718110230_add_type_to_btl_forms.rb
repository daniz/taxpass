class AddTypeToBtlForms < ActiveRecord::Migration
  def change
    add_column :btl_forms, :type, :string
  end
end
