class CreateForm867s < ActiveRecord::Migration
  def change
    create_table :form_867s do |t|
      t.integer :field_076
      t.integer :field_078
      t.integer :field_126
      t.integer :field_055
      t.integer :field_167_053
      t.integer :field_209
      t.integer :field_043
    end
  end
end
