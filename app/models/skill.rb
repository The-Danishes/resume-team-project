class Skill < ApplicationRecord
  has_many :people_skills
  has_many :students, through: :people_skills
end
