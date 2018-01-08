class AddStudent < ApplicationRecord

    has_many :student_subjects ,dependent: :destroy
    has_many :my_subjects,through: :student_subjects ,dependent: :destroy
	mount_uploader :image, ImageUploader
	validates :name , presence:true ,uniqueness:true

	def self.find_by_id(stud_id)
     where(id:stud_id).first
   end

	
end
