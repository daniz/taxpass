class AddUploadedFormIdToUploadedFiles < ActiveRecord::Migration
  def change
    add_column :uploaded_files, :uploaded_form_id, :integer
  end
end
