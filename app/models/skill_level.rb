class SkillLevel < ActiveRecord::Base
  has_many :skills

  def percent_complete(current_user)
  	possible_points = skills.count * 3
  	total_points = 0
  	skills.each do |s|
  		user_skill = s.skills_users.find_by(user_id: current_user) 
  		total_points += user_skill.skill_progress
  	end
  	percent = total_points.to_f / possible_points.to_f
  	(percent * 100).to_i
  end
end
