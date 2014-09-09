get '/level/:id' do
  @level = SkillLevel.find(params[:id])
  @title = @level.level
  @skills = @level.skills
  erb :'skill_levels/index'
end

put '/level/:id' do
	puts params[:skill_progress]
	params[:skill_progress].each do |k,v|
		skill_of_user = Skill.find(k).skills_users.find_by(user_id: current_user)
		initial_level = skill_of_user.skill_progress

		if initial_level != v
			puts "#{k} skill value is not the same, v is #{v} and initial_level is #{initial_level}"
			case v.to_i 
			when 0
				skill_of_user.doable_on = skill_of_user.reliable_on = skill_of_user.refined_on = nil
			when 1
				skill_of_user.doable_on = Time.now
			when 2
				skill_of_user.reliable_on = Time.now
			when 3
				puts "changing "
				skill_of_user.refined_on = Time.now
			end
			skill_of_user.save
		end

	end
	redirect "/level/#{params[:id]}"
end