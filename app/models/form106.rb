class Form106 < ActiveRecord::Base
  self.table_name = "form_106s"

  has_many :uploaded_forms, foreign_key: "owner_id"
end
