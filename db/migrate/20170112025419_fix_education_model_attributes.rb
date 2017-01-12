class FixEducationModelAttributes < ActiveRecord::Migration[5.0]
  def change
    rename_column :educations, :job_title, :degree
    rename_column :educations, :company_name, :university_name
    add_column :educations, :student_id, :integer
    add_column :experiences, :student_id, :integer
    add_column :capstones, :student_id, :integer
  end
end
