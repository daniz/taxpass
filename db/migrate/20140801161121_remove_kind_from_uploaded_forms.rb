class RemoveKindFromUploadedForms < ActiveRecord::Migration
  def change
    remove_column :uploaded_forms, :kind
  end
end
