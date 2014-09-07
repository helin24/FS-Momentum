get '/level/:id' do
  @level = SkillLevel.find(params[:id])
  @title = @level.level
  @skills = @level.skills
  erb :skill_level
end
