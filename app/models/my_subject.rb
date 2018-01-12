class MySubject < ApplicationRecord
	has_many :student_subjects ,dependent: :destroy
	has_many :add_students,through: :student_subjects ,dependent: :destroy
	validates :name ,presence:true,uniqueness: true
	
end
