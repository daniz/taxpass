class CreateForm857s < ActiveRecord::Migration
  def change
    create_table :form_857s do |t|
      t.integer :income
      t.integer :tax
      t.integer :request_id
      t.boolean :spouse
    end
  end
end
