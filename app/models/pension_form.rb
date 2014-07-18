class PensionForm < ActiveRecord::Base
  self.table_name = "pension_forms"

  def self.inheritance_column
    nil
  end

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
