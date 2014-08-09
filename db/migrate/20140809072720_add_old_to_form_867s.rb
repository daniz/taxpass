class AddOldToForm867s < ActiveRecord::Migration
  def change
    add_column :form_867s, :old, :boolean
  end
end
