class Api::V1::ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find_by(id: params[:id])
  end

  def create
    @experience = Experience.create({start_date: params[:start_date],end_date: params[:end_date],
      job_title: params[:job_title],company_name: params[:company_name],details: params[:details]})
    render :show
  end

  def update
    @experience = Experience.find_by(id: params[:id])
    @experience.assign_attributes({start_date: params[:start_date],end_date: params[:end_date],
      job_title: params[:job_title],company_name: params[:company_name],details: params[:details]})
    @experience.save
    render :show
  end

  def destroy
    @experience = Experience.find_by(id: params[:id])
    @experience.destroy
    redirect_to :index
  end
end
