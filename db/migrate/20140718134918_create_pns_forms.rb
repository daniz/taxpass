class CreatePnsForms < ActiveRecord::Migration
  def change
    create_table :pension_forms do |t|
      t.integer :income
      t.integer :tax
      t.boolean :spouse
      t.integer :request_id
    end
  end
end
