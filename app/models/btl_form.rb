class BtlForm < ActiveRecord::Base
  def self.inheritance_column
    nil
  end

  belongs_to :uploaded_form
end
