class AddUploadedFormIdToFormModels < ActiveRecord::Migration
  def change
    add_column :form_106s, :uploaded_form_id, :integer
    add_column :form_857s, :uploaded_form_id, :integer
    add_column :form_867s, :uploaded_form_id, :integer
    add_column :pension_forms, :uploaded_form_id, :integer
    add_column :receipts, :uploaded_form_id, :integer
  end
end
