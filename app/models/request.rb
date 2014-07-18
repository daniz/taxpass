class Request < ActiveRecord::Base
  has_many :kids
  accepts_nested_attributes_for :kids

  has_many :form106s
  has_many :form857s
  has_many :btl_forms
  has_many :pension_forms
end
