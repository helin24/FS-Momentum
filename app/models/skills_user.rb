class SkillsUser < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  has_many :notes

  def skill_progress
  	dated_progress = {"doable_on" => doable_on, "reliable_on" => reliable_on, "refined_on"=> refined_on}
  	dated_progress.select!{|k,v| v != nil}
  	puts "returning number..."
  	if dated_progress.size != 0
  		puts "max is #{dated_progress.max_by { |k,v| v}}"
	  	case dated_progress.max_by { |k,v| v}[0]
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
