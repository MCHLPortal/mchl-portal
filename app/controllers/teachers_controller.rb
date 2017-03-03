class TeachersController < ApplicationController
	def home
	end

	def show_class
		@students = Student.all
	end

	def show_student
		@student = Student.find(params[:id])
	end
end
