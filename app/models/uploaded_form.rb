class UploadedForm < ActiveRecord::Base
  has_many :uploaded_files
end
