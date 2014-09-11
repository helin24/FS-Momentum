
get '/skill/:id' do
  @skill = Skill.find(params[:id])
  @public_notes = @skill.notes.where(publicness: 'yes').where.not(user_id: session[:user_id])
  @private_notes = @skill.notes.where(user_id: session[:user_id])
  @title = @skill.name
  erb :'skills/index'
end

