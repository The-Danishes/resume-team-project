class PeopleSkill < ApplicationRecord
  belongs_to :student
  belongs_to :skill
end
