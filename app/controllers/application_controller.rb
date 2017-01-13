class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_student
  		@current_student ||= Student.find_by(id: session[:student_id]) if session[:student_id]
  end
  helper_method :current_student


  def authenticate_student!
  redirect_to '/login' unless current_student
  end

  def current_student_admin
  	if !current_student.admin
  		flash[:danger] = "Admins only!"
  		redirect_to "/index"
	  end
	end

	def authenticate_admin!
		redirect_to '/login' unless current_student.admin
	end
	
  protect_from_forgery with: :null_session
end
