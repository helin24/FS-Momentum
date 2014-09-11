# ------------ NOTES

post '/skill/:id' do
  note = Note.create(params['instructions'])
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

get '/note/:id/edit' do
  if request.xhr?
    
  end
end

put '/note/:id/edit' do 
  if request.xhr?
  end
end
