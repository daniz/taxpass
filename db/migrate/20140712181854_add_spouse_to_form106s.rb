class AddSpouseToForm106s < ActiveRecord::Migration
  def change
    add_column :form_106s, :spouse, :boolean
  end
end
