class AddPayingAlimonyToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :paying_alimony, :boolean
  end
end
