class Api::V1::CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all
  end

  def show
    @capstone = Capstone.find_by(id: params[:id])
  end

  def create
    @capstone = Capstone.create({name: params[:name],description: params[:description],
      URL: params[:URL],screenshot: params[:screenshot]})
    render :show
  end

  def update
    @capstone = Capstone.find_by(id: params[:id])
    @capstone.assign_attributes({name: params[:name],description: params[:description],
      URL: params[:URL],screenshot: params[:screenshot]})
    @capstone.save
    render :show
  end

  def destroy
    @capstone = Capstone.find_by(id: params[:id])
    @capstone.destroy
    redirect_to :index
  end
end
