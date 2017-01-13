class CreateCaptsones < ActiveRecord::Migration[5.0]
  def change
    create_table :captsones do |t|
      t.integer :student_id
      t.text :description
      t.string :url
      t.string :screenshot

      t.timestamps
    end
  end
end
