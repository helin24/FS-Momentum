class SkillLevel < ActiveRecord::Base
  has_many :skills

  def percent_complete
  	# Look at all skills and find skill-user
  	# Find points for each skill-user combination
  	# Add up and divide by total (which is number of skills * 3)
  end
end
