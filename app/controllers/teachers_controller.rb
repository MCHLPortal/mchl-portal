class TeachersController < ApplicationController
	def home
	end

	def show_class
		@students = Student.where(:sections_id => current_user.sections_id)
	end

	def find
		@students = Student.where("(fname = ? OR mname = ? OR lname = ?) AND sections_id = ?", params[:search_string], params[:search_string], params[:search_string], current_user.sections_id)
	
		render "show_class"
	end

	def show_student
		@student = Student.find(params[:id])
	end
end
