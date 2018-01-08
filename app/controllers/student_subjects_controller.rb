class StudentSubjectsController < ApplicationController

def edit

   add_student=AddStudent.find(params[:id])
   my_subject=MySubject.find(params[:sub_id])
   @student_subjects=StudentSubject.where(add_student_id: add_student,my_subject_id: my_subject).first
end

def update	
   # debugger
	#add_student=AddStudent.find(params[:id])
	#my_subject=MySubject.find(params[:sub_id])
	@student_subjects=StudentSubject.find(params[:id])
	if @student_subjects.update(mark_params)
      flash[:success]="Saved Successfully!"
      redirect_to add_students_path
	end
end

def show
   add_student=AddStudent.find(params[:id])
   my_subject=MySubject.find(params[:sub_id])
   @student_subjects=StudentSubject.where(add_student_id: add_student,my_subject_id: my_subject).first
end


private
def mark_params
params.require(:student_subject).permit(:marks)

end


end