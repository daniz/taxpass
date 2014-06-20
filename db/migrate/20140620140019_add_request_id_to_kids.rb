class AddRequestIdToKids < ActiveRecord::Migration
  def change
    add_column :kids, :request_id, :integer
  end
end
