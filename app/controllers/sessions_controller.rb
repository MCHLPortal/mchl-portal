class SessionsController < ApplicationController
	def new
	end

	def create
		user = Student.find_by(username: params[:session][:username].downcase)

		if user && user.authenticate(params[:session][:password])
			type = "student"
			log_in(user, type)
			redirect_to "/students/home"
		else
			user = Employee.find_by(username: params[:session][:username].downcase)

			if user && user.authenticate(params[:session][:password])
				if user.admin == false
					type = "teacher"
					log_in(user, type)
					redirect_to "/teachers/home"
				else
					type = "admin"
					log_in(user, type)
					redirect_to "/admin/home"
				end
			else
				render "new"
			end
		end
	end

	def destroy
		log_out
		redirect_to "/login"
	end
end
