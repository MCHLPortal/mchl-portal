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

	def show_student_handled
		@student = Student.find(params[:id])
		respond_to do |format|
			format.html
			format.js
		end
	end

	def edit_report_card
		@evaluation = Evaluation.where(student_id: params[:id]).first
		if params[:no] == "2"
			@evaluation = Evaluation.where(student_id: params[:id]).second
		elsif params[:no] == "3"
			@evaluation = Evaluation.where(student_id: params[:id]).third
		end

		@domains = @evaluation.domains
		respond_to do |format|
			format.html
			format.js
		end
	end

	def update_report_card
		@student = Student.find(params[:id])
		@evaluation = @student.evaluations.first
		if params[:no] == "2"
			@evaluation = @student.evaluations.second
		elsif params[:no] == "3"
			@evaluation = @student.evaluations.third
		end

		@evaluation.update_attributes(:date => DateTime.strptime(params[:evaluation][:date], '%m/%d/%Y').to_date)
		date = @evaluation.date
		age = date.year - @student.birthdate.year - ((date.month > @student.birthdate.month || (date.month == @student.birthdate.month && date.day >= @student.birthdate.day)) ? 0 : 1)
		@evaluation.update_attributes(:age => age)

		@domains = @evaluation.domains

		@domains.each do |d|
			d.skills.each do |s|
				s.update_attributes(:presence => params["#{s.id}"])
				s.update_attributes(:comment => params["comment_#{s.id}"])
			end
		end

		redirect_to "/teachers/class"
	end
end
