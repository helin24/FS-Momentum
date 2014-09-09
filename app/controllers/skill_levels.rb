get '/level/:id' do
  @level = SkillLevel.find(params[:id])
  @title = @level.level
  @skills = @level.skills
  erb :'skill_levels/index'
end

put '/level/:id' do
	puts params
end