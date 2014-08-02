class AddSpouseWorkplaceToForm106s < ActiveRecord::Migration
  def change
    add_column :form_106s, :spouse_workplace, :string
  end
end
