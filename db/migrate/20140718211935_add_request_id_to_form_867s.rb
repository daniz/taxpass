class AddRequestIdToForm867s < ActiveRecord::Migration
  def change
    add_column :form_867s, :request_id, :integer
  end
end
