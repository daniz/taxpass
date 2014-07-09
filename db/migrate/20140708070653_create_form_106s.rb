class CreateForm106s < ActiveRecord::Migration
  def change
    create_table :form_106s do |t|
      t.integer :field_158, default: 0
      t.integer :field_244, default: 0
      t.integer :field_248, default: 0
      t.integer :field_042, default: 0
      t.integer :field_045, default: 0
      t.integer :field_011, default: 0
      t.timestamps 
    end
  end
end
