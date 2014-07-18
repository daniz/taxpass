class BtlForm < ActiveRecord::Base
  self.table_name = "btl_forms"

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
