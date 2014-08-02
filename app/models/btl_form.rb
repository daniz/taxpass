class BtlForm < ActiveRecord::Base
  def self.inheritance_column
    nil
  end

  has_one :uploaded_form, foreign_key: "owner_id"
end
