class AddOwnerIdToUploadedForms < ActiveRecord::Migration
  def change
    add_column :uploaded_forms, :owner_id, :integer
  end
end
