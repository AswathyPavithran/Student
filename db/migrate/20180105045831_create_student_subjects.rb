class CreateStudentSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :student_subjects do |t|
      t.references :add_student, foreign_key: true
      t.references :my_subject, foreign_key: true

      t.timestamps
    end
  end
end
