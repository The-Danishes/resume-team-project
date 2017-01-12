class Api::V1::StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def create
    @student = Student.create({first_name: params[:name],last_name: params[:bio],email: params[:fav_food], phone_number: params[:job],
      bio: params[:bio],linkedin_url: params[:linkedin_url], twitter_handle: params[:twitter_handle], personal_url: params[:personal_url],
      resume_url: params[:resume_url], github_url: params[:github_url], photo: params[:photo]})
    render :show
  end

  def update
    @student = Student.find_by(id: params[:id])
    @student.assign_attributes({first_name: params[:name],last_name: params[:bio],email: params[:fav_food], phone_number: params[:job],
      bio: params[:bio],linkedin_url: params[:linkedin_url], twitter_handle: params[:twitter_handle], personal_url: params[:personal_url],
      resume_url: params[:resume_url], github_url: params[:github_url], photo: params[:photo]})
    @student.save
    render :show
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy
    redirect_to :index
  end

end
