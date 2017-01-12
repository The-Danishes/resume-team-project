class Skill < ApplicationRecord
  has_many :students, through: :people_skills
end
