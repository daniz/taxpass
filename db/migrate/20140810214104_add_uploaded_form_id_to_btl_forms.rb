class AddUploadedFormIdToBtlForms < ActiveRecord::Migration
  def change
    add_column :btl_forms, :uploaded_form_id, :integer
  end
end
