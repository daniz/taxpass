class AddDonationFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :donation_institution, :integer
    add_column :requests, :donation_sum, :integer

    add_column :requests, :spouse_donation_institution, :integer
    add_column :requests, :spouse_donation_sum, :integer
  end
end
