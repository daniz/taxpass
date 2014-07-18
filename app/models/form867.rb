class Form867 < ActiveRecord::Base
  self.table_name = "form_867s"

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
