json.student_id         student.id
json.first_name         student.first_name
json.last_name          student.last_name
json.email              student.email
json.phone_number       student.phone_number
json.bio                student.bio
json.linkedin_url       student.linkedin_url
json.twitter_handle     student.twitter_handle
json.personal_url       student.personal_url
json.resume_url         student.resume_url
json.github_url         student.github_url
json.photo              student.photo

json.education  student.educations do |education|
  json.start_date         education.start_date
  json.end_date           education.end_date
  json.degree             education.degree
  json.university_name    education.university_name
  json.details            education.details
end

json.experience student.experiences do |experience|
  json.start_date         experience.start_date
  json.end_date           experience.end_date
  json.job_title          experience.job_title
  json.company_name       experience.company_name
  json.details            experience.details
end

json.skills student.skills do |skill|
  json.name    skill.skill_name
end

json.projects student.capstones do |capstone|
  json.name         capstone.name
  json.description  capstone.description
  json.URL          capstone.URL
  json.screenshot   capstone.screenshot
end