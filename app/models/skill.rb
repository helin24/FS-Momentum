class Skill < ActiveRecord::Base
  belongs_to :skill_level
  has_many :notes
  has_many :skills_users
  has_many :users, through: :skills_users
end
