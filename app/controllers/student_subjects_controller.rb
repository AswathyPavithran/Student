class StudentSubjectsController < ApplicationController

def edit

   add_student=AddStudent.find(params[:id])
   @add_student=AddStudent.find(params[:id])
   @my_subject=MySubject.find(params[:sub_id])
   my_subject=MySubject.find(params[:sub_id])
   @student_subjects=StudentSubject.where(add_student_id: add_student,my_subject_id: my_subject).first
end

def update	
	#add_student=AddStudent.find(params[:id])
	#my_subject=MySubject.find(params[:sub_id])  
   add_student=AddStudent.find(params[:student_id])
	@student_subjects=StudentSubject.find(params[:id])
	if @student_subjects.update(mark_params)
      flash[:success]="Updated Successfully!"
      redirect_to add_student_path(add_student)
   else
      render 'edit'
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