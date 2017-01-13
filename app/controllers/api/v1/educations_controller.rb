class Api::V1::EducationsController < ApplicationController
  def index
    @educations = Education.all
  end

  def show
    @education = Education.find_by(id: params[:id])
  end

  def create
    @education = Education.create({start_date: params[:start_date],end_date: params[:end_date],
      degree: params[:degree],university_name: params[:university_name],details: params[:details]})
    render :show
  end

  def update
    @education = Education.find_by(id: params[:id])
    @education.assign_attributes({start_date: params[:start_date],end_date: params[:end_date],
      degree: params[:degree],university_name: params[:university_name],details: params[:details]})
    @education.save
    render :show
  end

  def destroy
    @education = Education.find_by(id: params[:id])
    @education.destroy
    redirect_to :index
  end
end
