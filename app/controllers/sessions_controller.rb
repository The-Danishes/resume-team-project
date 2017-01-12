class SessionsController < ApplicationController


	def new
	end

	def create
		student = Student.find_by(email: params[:email])
		if student && student.authenticate(params[:password])
		session[:student_id] = student.id
		flash[:success] = "You are logged in!"
		redirect_to '/index'
		else 
			flash[:warning] = "Invalid email or password!"
			redirect_to "/login"
		end


	end

	def destroy
		session[:student_id] = nil
		redirect_to "/index"
	end


end
