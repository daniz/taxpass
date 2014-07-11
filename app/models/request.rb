class Request < ActiveRecord::Base
  has_many :kids
  accepts_nested_attributes_for :kids

  has_many :form106s
  has_many :spouseForm106s, class_name: "Form106", foreign_key: "request_id"
end
