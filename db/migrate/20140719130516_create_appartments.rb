class CreateAppartments < ActiveRecord::Migration
  def change
    create_table :appartments do |t|
      t.integer :request_id
      t.string :name
      t.integer :ownership
      t.boolean :family_residence
      t.integer :months_rent
      t.integer :rent
      t.integer :expenses
    end
  end
end
