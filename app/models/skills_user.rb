class SkillsUser < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  has_many :notes

  def skill_progress
  	dated_progress = {"doable_on" => doable_on, "reliable_on" => reliable_on, "refined_on"=> refined_on}
  	if dated_progress.values.count(nil) < dated_progress.size
	  	case dated_progress.max_by { |k,v| v}
	  	when "doable_on"
	  		return 1
	  	when "reliable_on"
	  		return 2
	  	when "refined_on"
	  		return 3
	  	end
	  else
	  	return 0
	  end
  end
end
