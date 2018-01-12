class MySubjectsController < ApplicationController
    
    def index
      @my_subjects=MySubject.paginate(page: params[:page],per_page: 3)
    end

	def new
    
      @my_subjects=MySubject.new
	end

	def create
      @my_subjects=MySubject.new(sub_params)
      if @my_subjects.save
      	flash[:success]="Subject saved successfully"
      	redirect_to my_subject_path(@my_subjects)
      else
      	render 'new'
      end
	end
   
  def edit
     @my_subjects=MySubject.find(params[:id])
  end 

  def update
     @my_subjects=MySubject.find(params[:id])
     if @my_subjects.update(sub_params)
      flash[:success]="Updated successfully"
      redirect_to my_subjects_path
     else
       render 'edit'
     end
  end

  def search_subject
    if params[:search_param].blank?
      flash.now[:danger]=" You have entered an empty string!"
    else  
      @my_subjects=MySubject.where(name: params[:search_param])
      flash.now[:danger]="No subjects match in this search" if @my_subjects.blank?
    end
      respond_to do |format|
      format.js {render partial: 'my_subjects/result'}
       end  
  end

  # def search_my_subject
  # debugger
  #   h= {name: "achu" ,m1: "34" ,m2: "45"}
    
  # end
	def show
      @my_subjects=MySubject.find(params[:id])
	end
    
  def destroy
    @my_subjects=MySubject.find(params[:id])
    @my_subjects.destroy
    flash[:danger]="This profile is successfully deleted" 
    redirect_to my_subjects_path  
  end

	private
	def sub_params
		params.require(:my_subject).permit(:name)

	end

end


