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
		@sections = Section.all.map{|s| [s.name, s.id]}
	end

	def create_student
		@student = Student.new

		@student.student_id = params[:student][:student_id]
		@student.fname = params[:student][:fname]
		@student.mname = params[:student][:mname]
		@student.lname = params[:student][:lname]
		@username = params[:student][:lname].downcase + "_" + params[:student][:fname][0..2].downcase + params[:student][:mname][0].downcase
		@password = params[:student][:student_id] + params[:student][:lname].downcase
		@student.username = @username
		@student.password = @password
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
		@student.section_id = params[:student][:section_id]
		@student.assessment_id = Assessment.where(:level => Section.where(:id => params[:student][:section_id]).first.level).first.id
		@student.save

		redirect_to "/admin/students/#{@student.id}"
	end

	def show_student
		@student = Student.find(params[:id])
	end

	def edit_student
		@student = Student.find(params[:id])
		@sections = Section.all.map{|s| [s.name, s.id]}
	end

	def update_student
		@student = Student.find(params[:id])

		@student.update_attributes(:student_id => params[:student][:student_id])
		@student.update_attributes(:fname => params[:student][:fname])
		@student.update_attributes(:mname => params[:student][:mname])
		@student.update_attributes(:lname => params[:student][:lname])
		@username = params[:student][:lname].downcase + "_" + params[:student][:fname][0..2].downcase + params[:student][:mname][0].downcase
		@password = params[:student][:student_id] + params[:student][:lname].downcase
		@student.update_attributes(:username => @username)
		@student.update_attributes(:password => @password)
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
		@student.update_attributes(:section_id => params[:student][:section_id])

		redirect_to "/admin/students/#{@student.id}"
	end

	def delete_student
		@student = Student.find(params[:id])

		@student.destroy

		redirect_to "/admin/students"
	end

	def teachers
		@teachers = Employee.where(:admin => false)
	end

	def find_teacher
		@teachers = Employee.where("fname = ? OR mname = ? OR lname = ?", params[:search_string], params[:search_string], params[:search_string])
	
		render "teachers"
	end

	def new_teacher
		@teacher = Employee.new
		@sections = Section.all.map{|s| [s.name, s.id]}
	end

	def create_teacher
		@teacher = Employee.new

		@teacher.employee_id = params[:employee][:employee_id]
		@teacher.admin = false;
		@teacher.fname = params[:employee][:fname]
		@teacher.mname = params[:employee][:mname]
		@teacher.lname = params[:employee][:lname]
		@username = "e" + params[:employee][:lname].downcase + "_" + params[:employee][:fname][0..2].downcase + params[:employee][:mname][0].downcase
		@password = params[:employee][:employee_id] + params[:employee][:lname].downcase
		@teacher.username = @username
		@teacher.password = @password
		@teacher.section_id = params[:employee][:section_id]
		@teacher.save

		redirect_to "/admin/teachers/#{@teacher.id}"
	end

	def show_teacher
		@teacher = Employee.find(params[:id])
	end

	def edit_teacher
		@teacher = Employee.find(params[:id])
		@sections = Section.all.map{|s| [s.name, s.id]}
	end

	def update_teacher
		@teacher = Employee.find(params[:id])

		@teacher.update_attributes(:employee_id => params[:employee][:employee_id])
		@teacher.update_attributes(:admin => false);
		@teacher.update_attributes(:fname => params[:employee][:fname])
		@teacher.update_attributes(:mname => params[:employee][:mname])
		@teacher.update_attributes(:lname => params[:employee][:lname])
		@username = "e" + params[:employee][:lname].downcase + "_" + params[:employee][:fname][0..2].downcase + params[:employee][:mname][0].downcase
		@password = params[:employee][:employee_id] + params[:employee][:lname].downcase
		@teacher.update_attributes(:username => @username)
		@teacher.update_attributes(:password => @password)
		@teacher.update_attributes(:section_id => params[:employee][:section_id])

		redirect_to "/admin/teachers/#{@teacher.id}"
	end

	def delete_teacher
		@teacher = Employee.find(params[:id])
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
	
	def payments
		@payments = Payment.where(:student_id => params[:id])
	end

	def new_payment
		@payment  = Payment.new		
	end

	def create_payment
		@payment = Payment.new

		@student = Student.find(params[:id])
		@count = @student.payments.count
		@balance = 0
		
		if (@count == 0)
			@balance = Assessment.find(@student.assessment_id).total_assessment
		else
			@balance = @student.payments.last.balance
		end
		
		@payment.student_id = @student.id
		@payment.date = DateTime.strptime(params[:payment][:date], '%m/%d/%Y').to_date
		@payment.amount = params[:payment][:amount]
		@payment.balance = @balance - params[:payment][:amount].to_f
		@payment.save

		redirect_to "/admin/students/#{@student.id}/payments"
	end

	def delete_payment
		@payment = Payment.find(params[:id])
		@payment.destroy

		redirect_to "/admin/students/#{@payment.student_id}/payments"
	end
		
	def assessments
		@assessments = Assessment.all
	end
	
	def edit_assessment
		@assessment = Assessment.find(params[:id])
	end

	def update_assessment
		@assessment = Assessment.find(params[:id])

		@assessment.update_attributes(:tuition => params[:assessment][:tuition])
		@assessment.update_attributes(:other_fees => params[:assessment][:other_fees])
		@assessment.update_attributes(:other_assessment => params[:assessment][:other_assessment])
		@total_assessment = params[:assessment][:tuition].to_f + params[:assessment][:other_fees].to_f + params[:assessment][:other_assessment].to_f
		@assessment.update_attributes(:total_assessment => @total_assessment)
		
		redirect_to "/admin/assessments"
	end
end
