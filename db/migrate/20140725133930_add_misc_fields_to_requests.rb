class AddMiscFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :literature_book, :string
    add_column :requests, :literature_sum, :integer
    add_column :requests, :spouse_literature_book, :string
    add_column :requests, :spouse_literature_sum, :integer

    add_column :requests, :course_name, :string
    add_column :requests, :course_institute, :string
    add_column :requests, :course_sum, :integer
    add_column :requests, :spouse_course_name, :string
    add_column :requests, :spouse_course_institute, :string
    add_column :requests, :spouse_course_sum, :integer

    add_column :requests, :cpa_sum, :integer
    add_column :requests, :cpa_type, :integer
    add_column :requests, :cpa_rating, :integer
    add_column :requests, :spouse_cpa_sum, :integer
    add_column :requests, :spouse_cpa_type, :integer
    add_column :requests, :spouse_cpa_rating, :integer
    
  end
end
