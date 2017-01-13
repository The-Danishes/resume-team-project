class ResumesController < ApplicationController

  def home
  end  

  def pdf_renderer
    # @resumes = Unirest.get("localhost:3002/api/v1/students.json").body

    @resume = Student.find(params[:id])

    # @resume = {first_name: "Joe", last_name: "Dude", email: "email@email.com", phone_number: "123213123", linkedin_url: "lol.linkedin.com", twitter_handle: "lol@twitter", personal_url: "lol.com", github_url: "lol.github.com", short_bio: "This bio is short, lol. BVFEIV BEIFBVI EBVIREB IVE RBVREI VEIVIT HVI RT IRJ GI JREI GI REG IRIGNT RIG NI TBR EIJI GRJOE JOR EJKOVJOEJOREJOVJREOJ VOJEOJROJBORJOBORBOR", photo: "lol.com", experience: [{job_title: "lol master", company_name: "lols", details: "I lold", start_date: "1/1/17", end_date: "1/2/17"}], education:[{ degree: "masters in lol", start_date: "1/1/17", end_date: "1/2/17", university_name: "Lol state University", details: "I lold more"}], skills: ["I lol real good", "Do stuffs", "LOL", "LDCSV"], capstone: [{name: "LoL galore", description: "Lol a lot", screenshot: "no"}]}
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.font_families.update(
        "MyFont" => {
          :bold => "Helvetica-Bold",
          :normal => "Helvetica"
          })
        pdf.font("MyFont", :style => :bold)
        pdf.text "<u>#{@resume.first_name} #{@resume.last_name}</u>", :align => :center, inline_format: true, :size => 20
        pdf.font("MyFont", :style => :normal)
        pdf.text "Contact Info:", :align => :center, :style => :bold, :size => 15
        pdf.text "Email: #{@resume.email} | Phone: #{@resume.phone_number}", :align => :center
        pdf.text "Linkedin: #{@resume.linkedin_url} | Twitter: #{@resume.twitter_handle}", :align => :center
        pdf.text "Personal Website: #{@resume.personal_url} | Github: #{@resume.github_url}", :align => :center
        pdf.text "<br>", inline_format: true
        pdf.text "<u>Bio:</u>", inline_format: true, :style => :bold, :size => 15
        pdf.indent(40, 40) do
          pdf.text "#{@resume.bio}"
        end
        pdf.text "<br>", inline_format: true
        pdf.text "<u>Skills:</u>", inline_format: true, :style => :bold, :size => 15
        @resume.skills.each do |skill|
          pdf.indent(20) do
            pdf.text "• #{skill.skill_name}"
          end
        end
        pdf.text "<br>", inline_format: true
        pdf.text "<u>Experience:</u>", inline_format: true, :style => :bold, :size => 15
        count = 0
        @resume.experiences.each do |exp|
          pdf.text "#{exp.job_title}", :style => :bold
          pdf.text "#{exp.company_name}, #{exp.start_date.strftime("%m-%d-%y")} - #{exp.end_date.strftime("%m-%d-%y")}"
          pdf.text "#{exp.details}"
          pdf.text "<br>", inline_format: true
          count += 1
          if count == 3
            break
          end
        end
        pdf.text "<u>Education:</u>", inline_format: true, :style => :bold, :size => 15
        count = 0
        @resume.educations.each do |edu|
          pdf.text "#{edu.university_name}", :style => :bold
          pdf.text "#{edu.degree}, #{edu.start_date.strftime("%m-%d-%y")} - #{edu.end_date.strftime("%m-%d-%y")}"
          pdf.text "#{edu.details}"
          pdf.text "<br>", inline_format: true
          count += 1
          if count == 2
            break
          end
        end
        pdf.text "<u>Projects:</u>", inline_format: true, :style => :bold, :size => 15
        count = 0
        @resume.capstones.each do |cap|
          pdf.indent(20) do
            pdf.text "• #{cap.name}", :style => :bold
          end
          pdf.indent(35) do
            pdf.text "#{cap.description}"
          end
          count += 1
          if count == 2
            break
          end
        end


        send_data pdf.render,
          filename: "resume_#{@resume.first_name}",
          type: 'application/pdf',
          disposition: 'inline'

      end
    end
  end
end
