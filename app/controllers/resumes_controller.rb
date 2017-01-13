class ResumesController < ApplicationController

  def home
  end  

  def pdf_renderer
    #@resumes = Unirest.get("BLAH").body

    @resume = {first_name: "Joe", last_name: "Dude", email: "email@email.com", phone_number: "123213123", linkedin_url: "lol.linkedin.com", twitter_handle: "lol@twitter", personal_url: "lol.com", github_url: "lol.github.com", short_bio: "This bio is short, lol", photo: "lol.com", experience: [{job_title: "lol master", company_name: "lols", details: "I lold"}], education:[{ degree: "masters in lol", start_date: "1/1/17", end_date: "1/2/17", university_name: "Lol state University", details: "I lold more"}], skills: ["I lol real good"], capstone: [{name: "LoL galore", description: "Lol a lot", screenshot: "no"}]}
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "#{@resume[:first_name]} #{@resume[:last_name]}"
        pdf.text "Contact Info:"
        pdf.text "Email: #{@resume[:email]} | Phone: #{@resume[:phone_number]}"
        pdf.text "Linkedin: #{@resume[:linkedin_url]} | Twitter: #{@resume[:twitter_handle]} | Personal Website: #{@resume[:personal_url]} | Github: #{@resume[:github_url]}"
        pdf.text "#{@resume[:short_bio]}"
        pdf.text "#{@resume[:photo]}"
        @resume[:experience].each do |exp|
          pdf.text "#{exp[:job_title]} | #{exp[:start_date]} - #{exp[:end_date]}"
          pdf.text "#{exp[:company_name]}"
          pdf.text "#{exp[:details]}"
        end
        @resume[:education].each do |edu|
          pdf.text "#{edu[:degree]} | #{edu[:start_date]} - #{edu[:end_date]}"
          pdf.text "#{edu[:university_name]}"
          pdf.text "#{edu[:details]}"
        end
        @resume[:skills].each do |skill|
          pdf.text "#{skill}"
        end
        @resume[:capstone].each do |cap|
          pdf.text "#{cap[:name]} | #{cap[:url]}"
          pdf.text "#{cap[:description]}"
          pdf.text "#{cap[:screenshot]}"
        end

        send_data pdf.render,
          filename: "resume_#{@resume[:first_name]}",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end

    # info = {first_name: "Joe", last_name: "Dude", email: "email@email.com", phone_number: "123213123", linkedin_url: "lol.linkedin.com", twitter_handle: "lo@twitter", personal_url: "lol.com", github_url: "lol.github.com", short_bio: "This bio is short, lol", photo: "lol.com", experience: [{job_title: "lol master", company_name: "lols", details: "I lold"}], education:[{ degree: "masters in lol", start_date: "1/1/17", end_date: "1/2/17", university_name: "Lol state University", details: "I lold more"}], skills: ["I lol real good"], capstone: [{name: "LoL galore", description: "Lol a lot", screenshot: "no"}]}

    # Prawn::Document.generate("metadata.pdf", :info => info) do
    #   text ""
    # end

    # Prawn::Document.generate("#{@resume.first_name}_resume.pdf") do
    #   text "#{@resume.first_name} #{@resume.last_name}"
    #   text "Contact Info:"
    #   text "Email: #{@resume.email} | Phone: #{@resume.phone_number}"
    #   text "Linkedin: #{@resume.linkedin_url} | Twitter: #{@resume.twitter_handle} | Personal Website: #{@resume.personal_url} | Github: #{@github_url}"
    #   text "#{@resume.short_bio}"
    #   text "#{@resume.photo}"
    #   @resume.experience.each do |exp|
    #     text "#{exp.job_title} | #{exp.start_date} - #{exp.end_date}"
    #     text "#{exp.company_name}"
    #     text "#{exp.details}"
    #   end
    #   @resume.education.each do |edu|
    #     text "#{edu.degree} | #{edu.start_date} - #{edu.end_date}"
    #     text "#{edu.university_name}"
    #     text "#{edu.details}"
    #   end
    #   @resume.skills.each do |skill|
    #     text "#{skill.name}"
    #   end
    #   @resume.capstone.each do |cap|
    #     text "#{cap.name} | #{cap.url}"
    #     text "#{cap.description}"
    #     text "#{cap.screenshot}"
    #   end
    # end
  end
end
