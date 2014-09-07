
get '/skill/:id' do
  @skill = Skill.find(params[:id])
  @public_notes = @skill.notes.where(publicness: 'yes').where.not(user_id: session[:user_id])
  @private_notes = @skill.notes.where(user_id: session[:user_id])
  @title = @skill.name
  erb :skill
end

post '/skill/:id' do
  note = Note.create(text: params['instructions'])
  note.publicness = params[:public] == nil ? 'no' : 'yes'
  note.user = User.find(session[:user_id])
  note.skill = Skill.find(params[:id])
  note.save
  if request.xhr?
    n = note
    erb :'/skills/_note', layout: false, locals: {n: n}
  else
    redirect "skill/#{params[:id]}"
  end
end

delete '/skill/:id' do
  if request.xhr? # how to do this erb with link instead of submit form?
    note = Note.find(params[:note_id])
    note.destroy
  end
end
