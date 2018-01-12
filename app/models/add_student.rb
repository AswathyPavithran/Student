class AddStudent < ApplicationRecord

    has_many :student_subjects ,dependent: :destroy
    has_many :my_subjects,through: :student_subjects ,dependent: :destroy
	mount_uploader :image, ImageUploader
	validates :name , presence:true ,uniqueness:true
	validates_processing_of :image
    validate :image_size_validation
 
    private
     def image_size_validation
       errors[:image] << "should be less than 200KB" if image.size > 0.2.megabytes
     end
    end
