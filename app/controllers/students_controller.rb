class StudentsController < ApplicationController
	def home
	end

	def profile
	end

	def report_card
		@student = Student.find(current_user.id)
		@evaluations = @student.evaluations
	end

	def my_class
		@classmates = Student.where(:section_id => current_user.section_id).where.not(:id => current_user.id)
	end

	def payments
		@student = Student.find(current_user.id)
		@assessment = Assessment.find(@student.assessment_id)
		@payments = Payment.where(:student_id => @student.id)
	end
end
