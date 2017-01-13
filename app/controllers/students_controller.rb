class StudentsController < ApplicationController


	def new
		render 'new.html.erb'
	end

	def create
		student = Student.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],  password: params[:password], password_confirmation: params[:password_confirmation])

		if student.save 
			session[:student_id] = student.id
			flash[:success] = "You are signed up!"
			redirect_to "/index"
	  else
	  	flash[:warning] = "Passwords didn't match!"
	  	redirect_to '/signup' 
	  end

	end



end
