class AdminsController < ApplicationController
	def home
	end

	def students
		@students = Student.all
	end

	def find_student
		@students = Student.where("fname = ? OR mname = ? OR lname = ?", params[:search_string], params[:search_string], params[:search_string])
	
		render "students"
	end

	def new_student
		@student  = Student.new
	end

	def create_student
		@student = Student.new

		@student.fname = params[:student][:fname]
		@student.mname = params[:student][:mname]
		@student.lname = params[:student][:lname]
		@student.sex = params[:student][:sex]
		@student.birthdate = DateTime.strptime(params[:student][:birthdate], '%m/%d/%Y').to_date
		now = Time.now.utc.to_date
		birthdate = DateTime.strptime(params[:student][:birthdate], '%m/%d/%Y').to_date
		age = now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
		@student.age = age
		@student.address = params[:student][:address]
		@student.handedness = params[:student][:handedness]
		@student.father_fname = params[:student][:father_fname]
		@student.father_mname = params[:student][:father_mname]
		@student.father_lname = params[:student][:father_lname]
		@student.father_occupation = params[:student][:father_occupation]
		@student.father_age = params[:student][:father_age]
		@student.father_educ_attainment = params[:student][:father_educ_attainment]
		@student.mother_fname = params[:student][:mother_fname]
		@student.mother_mname = params[:student][:mother_mname]
		@student.mother_lname = params[:student][:mother_lname]
		@student.mother_occupation = params[:student][:mother_occupation]
		@student.mother_age = params[:student][:mother_age]
		@student.mother_educ_attainment = params[:student][:mother_educ_attainment]
		@student.save

		redirect_to "/admin/students/#{@student.id}"
	end

	def show_student
		@student = Student.find(params[:id])
	end

	def edit_student
		@student = Student.find(params[:id])
	end

	def update_student
		@student = Student.find(params[:id])

		@student.update_attributes(:fname => params[:student][:fname])
		@student.update_attributes(:mname => params[:student][:mname])
		@student.update_attributes(:lname => params[:student][:lname])
		@student.update_attributes(:sex => params[:student][:sex])
		@student.update_attributes(:birthdate => DateTime.strptime(params[:student][:birthdate], '%m/%d/%Y').to_date)
		birthdate = DateTime.strptime(params[:student][:birthdate], '%m/%d/%Y').to_date
		now = Time.now.utc.to_date
		age = now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
		@student.update_attributes(:age => age)
		@student.update_attributes(:address => params[:student][:address])
		@student.update_attributes(:handedness => params[:student][:handedness])
		@student.update_attributes(:father_fname => params[:student][:father_fname])
		@student.update_attributes(:father_mname => params[:student][:father_mname])
		@student.update_attributes(:father_lname => params[:student][:father_lname])
		@student.update_attributes(:father_occupation => params[:student][:father_occupation])
		@student.update_attributes(:father_age => params[:student][:father_age])
		@student.update_attributes(:father_educ_attainment => params[:student][:father_educ_attainment])
		@student.update_attributes(:mother_fname => params[:student][:mother_fname])
		@student.update_attributes(:mother_mname => params[:student][:mother_mname])
		@student.update_attributes(:mother_lname => params[:student][:mother_lname])
		@student.update_attributes(:mother_occupation => params[:student][:mother_occupation])
		@student.update_attributes(:mother_age => params[:student][:mother_age])
		@student.update_attributes(:mother_educ_attainment => params[:student][:mother_educ_attainment])

		redirect_to "/admin/students/#{@student.id}"
	end

	def delete_student
		@student = Student.find(params[:id])

		@student.destroy

		redirect_to "/admin/students"
	end

	def teachers
		@teachers = Teacher.all
	end

	def find_teacher
		@teachers = Teacher.where("fname = ? OR mname = ? OR lname = ?", params[:search_string], params[:search_string], params[:search_string])
	
		render "teachers"
	end

	def new_teacher
		@teacher = Teacher.new
		@sections = Section.all.map{|s| [s.name, s.id]}
	end

	def create_teacher
		@teacher = Teacher.new

		@teacher.fname = params[:teacher][:fname]
		@teacher.mname = params[:teacher][:mname]
		@teacher.lname = params[:teacher][:lname]
		@teacher.sections_id = params[:teacher][:sections_id]
		@teacher.save

		@section = Section.where(id: @teacher.sections_id).first
		@section.teachers_id = @teacher.id
		@section.save

		redirect_to "/admin/teachers/#{@teacher.id}"
	end

	def show_teacher
		@teacher = Teacher.find(params[:id])
	end

	def edit_teacher
		@teacher = Teacher.find(params[:id])
		@sections = Section.all.map{|s| [s.name, s.id]}
	end

	def update_teacher
		@teacher = Teacher.find(params[:id])

		@teacher.update_attributes(:fname => params[:teacher][:fname])
		@teacher.update_attributes(:mname => params[:teacher][:mname])
		@teacher.update_attributes(:lname => params[:teacher][:lname])
		@teacher.update_attributes(:sections_id => params[:teacher][:sections_id])

		@section = Section.where(id: @teacher.sections_id).first
		@section.update_attributes(:teachers_id => @teacher.id)

		redirect_to "/admin/teachers/#{@teacher.id}"
	end

	def delete_teacher
		@teacher = Teacher.find(params[:id])
		@teacher.destroy

		redirect_to "/admin/teachers"
	end

	def sections
		@sections = Section.all
	end

	def find_section
		@sections = Section.where(name: params[:search_string])
	
		render "sections"
	end

	def new_section
		@section = Section.new
	end

	def create_section
		@section = Section.new

		@section.name = params[:section][:name]
		@section.level = params[:section][:level]
		@section.room_number = params[:section][:room_number]
		@section.save

		redirect_to "/admin/sections"
	end

	def show_section
		@section = Section.find(params[:id])
	end

	def edit_section
		@section = Section.find(params[:id])
	end

	def update_section
		@section = Section.find(params[:id])

		@section.update_attributes(:name => params[:section][:name])
		@section.update_attributes(:level => params[:section][:level])
		@section.update_attributes(:room_number => params[:section][:room_number])

		redirect_to "/admin/sections/#{@section.id}"
	end

	def delete_section
		@section = Section.find(params[:id])
		@section.destroy

		redirect_to "/admin/sections"
	end
end
