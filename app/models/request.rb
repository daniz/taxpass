class Request < ActiveRecord::Base
  has_many :kids
  accepts_nested_attributes_for :kids

  has_many :form106s
end
