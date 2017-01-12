class ResumesController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end  

  def index
    @students = Student.all
  end
  
  def pdf_renderer
    @resumes = Unirest.get("BLAH").body

    @resume = @resumes.student.params[:id]

    Prawn::Document.generate("#{@resume.first_name}_resume.pdf") do
      text "#{@resume.first_name} #{@resume.last_name}"
      text "Contact Info:"
      text "Email: #{@resume.email} | Phone: #{@resume.phone_number}"
      text "Linkedin: #{@resume.linkedin_url} | Twitter: #{@resume.twitter_handle} | Personal Website: #{@resume.personal_url} | Github: #{@github_url}"
      text "#{@resume.short_bio}"
      text "#{@resume.photo}"
      @resume.experience.each do |exp|
        text "#{exp.job_title} | #{exp.start_date} - #{exp.end_date}"
        text "#{exp.company_name}"
        text "#{exp.details}"
      end
      @resume.education.each do |edu|
        text "#{edu.degree} | #{edu.start_date} - #{edu.end_date}"
        text "#{edu.university_name}"
        text "#{edu.details}"
      end
      @resume.skills.each do |skill|
        text "#{skill.name}"
      end
      @resume.capstone.each do |cap|
        text "#{cap.name} | #{cap.url}"
        text "#{cap.description}"
        text "#{cap.screenshot}"
      end
    end
  end

end
