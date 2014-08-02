class Form867 < ActiveRecord::Base
  self.table_name = "form_867s"

  has_one :uploaded_form, foreign_key: "owner_id"
end
