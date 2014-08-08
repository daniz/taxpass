class Receipt < ActiveRecord::Base
  has_one :uploaded_form, foreign_key: "owner_id"
end
