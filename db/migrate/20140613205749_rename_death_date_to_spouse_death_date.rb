class RenameDeathDateToSpouseDeathDate < ActiveRecord::Migration
  def change
    rename_column :requests, :death_date, :spouse_death_date
  end
end
