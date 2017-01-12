class CreatePeopleSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :people_skills do |t|
      t.integer :student_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
