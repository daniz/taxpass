class Form106 < ActiveRecord::Base
  self.table_name = "form_106s"

  has_one :uploaded_form, foreign_key: "owner_id"
end
