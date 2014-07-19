class AddLotteryFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :gambling_profit, :integer
    add_column :requests, :gambling_tax, :integer
    add_column :requests, :lottery_profit, :integer
    add_column :requests, :lottery_tax, :integer
    add_column :requests, :prize_profit, :integer
    add_column :requests, :prize_tax, :integer

    add_column :requests, :spouse_gambling_profit, :integer
    add_column :requests, :spouse_gambling_tax, :integer
    add_column :requests, :spouse_lottery_profit, :integer
    add_column :requests, :spouse_lottery_tax, :integer
    add_column :requests, :spouse_prize_profit, :integer
    add_column :requests, :spouse_prize_tax, :integer
    
  end
end
