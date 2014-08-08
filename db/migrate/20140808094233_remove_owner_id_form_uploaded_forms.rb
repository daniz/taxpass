class RemoveOwnerIdFormUploadedForms < ActiveRecord::Migration
  def change
    remove_column :uploaded_forms, :owner_id  
  end
end 
