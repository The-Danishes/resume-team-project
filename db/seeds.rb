# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Student.destroy_all
Experience.destroy_all
Education.destroy_all
Skill.destroy_all
Capstone.destroy_all

student_list=[]
100.times do
  student_list.push({
    first_name: Faker::StarWars.character,
    last_name: Faker::StarWars.droid,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    bio: Faker::Hipster.paragraph
  })
end

student_list.each do |student|
  Student.create({first_name: student[:first_name],last_name: student[:last_name],email: student[:email],phone_number: student[:phone_number],bio: student[:bio]})
end

skill_list=[]
100.times do
  skill_list.push({
    skill_name: Faker::Music.instrument
  })
end

skill_list.each do |student|
  Skill.create({skill_name: student[:skill_name]})
end

capstone_list=[]
100.times do
  capstone_list.push({
    name: Faker::App.name,
    description: Faker::Hacker.say_something_smart,
    URL: Faker::Internet.url,
    screenshot: Faker::Company.logo
  })
end

Student.ids.each do |student_id|
  capstone = capstone_list.sample
  Capstone.create({name: capstone[:name], description: capstone[:description], URL: capstone[:URL], screenshot: capstone[:screenshot], student_id: student_id})
  5.times do 
    PeopleSkill.create({student_id: student_id, skill_id: Skill.ids.sample})
  end  
end