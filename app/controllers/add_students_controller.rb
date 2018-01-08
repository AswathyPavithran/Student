class AddStudentsController < ApplicationController

	def index
     @add_student=AddStudent.all
     end
     

	def new
		@add_student= AddStudent.new

	end

	def create
       @add_student=AddStudent.new(student_params)
       if @add_student.save
       	flash[:success]="Saved Successfully"
       	redirect_to add_student_path(@add_student)
       else
       	render 'new'
       end
	end
     
  def show
    # debugger
     @add_student=AddStudent.find(params[:id])
     # @student_subjects=StudentSubject.find_by(add_student_id: @add_student.id)
      @student_subjects= StudentSubject.where(add_student_id: @add_student.id)
     #@student_subjects=StudentSubject.where(add_student_id: add_student)

  end
     
  def search
    if params[:search_param].blank?
      flash[:danger]="You have entered an empty string"
    else
    @add_students=AddStudent.where(name: params[:search_param])
    respond_to do |format|    
       format.js {render partial:'add_students/result'}
     end
    end
 end

  def destroy
       @add_student=AddStudent.find(params[:id])
       @add_student.destroy       
       flash[:danger]="This profile is successfully deleted" 
       redirect_to add_students_path    	

  end

	private
	def student_params
		params.require(:add_student).permit(:name,:image,my_subject_ids: [])

	end


end