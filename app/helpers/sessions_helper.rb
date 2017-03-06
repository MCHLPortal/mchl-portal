module SessionsHelper
	def log_in(user, type)
		session[:user_id] = user.id
		session[:user_type] = type
	end

	def current_user
		if session[:user_type] == "student"
			@current_user ||= Student.find_by(id: session[:user_id])
		elsif session[:user_type] == "teacher" || session[:user_type] == "admin"
    		@current_user ||= Employee.find_by(id: session[:user_id])
    	end
 	end

 	def log_out
 		session.delete(:user_id)
    	@current_user = nil
  	end
end
