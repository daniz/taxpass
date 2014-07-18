class CreateBtlForms < ActiveRecord::Migration
  def change
    create_table :btl_forms do |t|
      t.integer :income
      t.integer :tax
      t.integer :request_id
      t.boolean :spouse
    end
  end
end
