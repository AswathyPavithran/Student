class AddMarksToStudentSubjects < ActiveRecord::Migration[5.1]
  def change

  	add_column :student_subjects ,:marks,:integer
  end
end
