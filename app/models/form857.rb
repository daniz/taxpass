class Form857 < ActiveRecord::Base
  self.table_name = "form_857s"

  has_one :uploaded_form, foreign_key: "owner_id"
end
