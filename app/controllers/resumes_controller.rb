class ResumesController < ApplicationController

  def show

    client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "HilBpKw3xslFKt1Xe27OMw9qO"
    config.consumer_secret     = "2Lkh9q3J3M2YOWEktYUrnN0Fk5WVbJFek2SZhJvKdjjskrzQTA"
    config.access_token        = "604862102-GyAruBH9TAyf3nQc75lGzxaPI6Erk7ISyRPM9HY6"
    config.access_token_secret = "ooKnSFdSdiISSuJsJJYGD0oJv9MFl4AgkGFzZBu6bqN4u"
    end

    @student = Unirest.get("localhost:3000/api/v1/students/#{params[:id]}/resume").body

   

    @tweet = client.user_timeline(@student["twitter_handle"]).first.text


    @education = Unirest.get("localhost:3000/api/v1/educations/#{params[:id]}").body

  end

  def index 
    client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "HilBpKw3xslFKt1Xe27OMw9qO"
    config.consumer_secret     = "2Lkh9q3J3M2YOWEktYUrnN0Fk5WVbJFek2SZhJvKdjjskrzQTA"
    config.access_token        = "604862102-GyAruBH9TAyf3nQc75lGzxaPI6Erk7ISyRPM9HY6"
    config.access_token_secret = "ooKnSFdSdiISSuJsJJYGD0oJv9MFl4AgkGFzZBu6bqN4u"
    end
   
   
    @students = Unirest.get("localhost:3000/api/v1/students").body
  end

  def create
    input_first_name = params[:first_name]
    input_last_name = params[:last_name]
    input_email = params[:email]
    input_phone_number = params[:phone_number]
    input_bio = params[:bio]
    input_linkedin_url = params[:linkedin_url]
    input_twitter_handle = params[:twitter_handle]
    input_personal_url = params[:personal_url]
    input_resume_url = params[:resume_url]
    input_github_url = params[:github_url]
    input_photo = params[:photo]
    
    @student = Unirest.post("/api/v1/students/", 
                parameters: 
                {first_name: input_first_name, 
                last_name: input_last_name,
                email: input_email,
                phone_number: input_phone_number,
                bio: input_bio,
                linkedin_url: input_linkedin_url,
                twitter_handle: input_twitter_handle,
                personal_url: input_personal_url,
                resume_url: input_resume_url,
                github_url: input_github_url,
                photo: input_photo 
                },
                headers: {"Accept" => "application/json"}).body
    redirect_to students_path(@student["id"])
  end

  def edit
    @student = Unirest.get("/api/v1/students.json").body
  end

  def update
    student = Unirest.post("/api/v1/students/:id",
              parameters: 
              {first_name: input_first_name, 
              last_name: input_last_name,
              email: input_email,
              phone_number: input_phone_number,
              bio: input_bio,
              linkedin_url: input_linkedin_url,
              twitter_handle: input_twitter_handle,
              personal_url: input_personal_url,
              resume_url: input_resume_url,
              github_url: input_github_url,
              photo: input_photo 
              },
              headers: {"Accept" => "application/json"}).body
  
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy

    redirect_to "/resumes/#{student.id}"
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
