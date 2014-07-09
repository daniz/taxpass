class AddRequestIdToForm106s < ActiveRecord::Migration
  def change
    add_column :form_106s, :request_id, :integer
  end
end
