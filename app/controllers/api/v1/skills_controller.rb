class Api::V1::SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find_by(id: params[:id])
  end

  def create
    @skill = Skill.create({name: params[:name]})
    render :show
  end

  def update
    @skill = Skill.find_by(id: params[:id])
    @skill.assign_attributes({name: params[:name]})
    @skill.save
    render :show
  end

  def destroy
    @skill = Skill.find_by(id: params[:id])
    @skill.destroy
    redirect_to :index
  end
end
