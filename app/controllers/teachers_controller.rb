class TeachersController < ApplicationController
	def home
	end

	def show_class
		@students = Student.where(:section_id => current_user.section_id)
	end

	def find
		@students = Student.where("(fname = ? OR mname = ? OR lname = ?) AND section_id = ?", params[:search_string], params[:search_string], params[:search_string], current_user.section_id)
	
		render "show_class"
	end

	def show_student
		@student = Student.find(params[:id])
	end

	def edit_report_card
		@evaluation = Evaluation.where(student_id: params[:id]).first
		@domains = @evaluation.domains
	end

	def update_report_card
	end
end
