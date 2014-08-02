class CreateUploadedForms < ActiveRecord::Migration
  def change
    create_table :uploaded_forms do |t|
      t.string :kind
    end
  end
end
