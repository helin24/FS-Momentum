# ------------ CREATING USER

get '/users/create' do
  @title = "Create an account"
  erb :'users/create'
end

post '/users/create' do # post creating user account
  email = params[:user][:email]
  password = params[:user][:password]
  matched_password = params[:reentered_password]
  if email && password && matched_password
    new_user = User.create(params[:user])
    new_user.skills << Skill.all
    photo = Photo.create(file: params[:filename])
    photo.user = new_user
    photo.save
  end
  redirect '/users/login'
end

# ------------ LOGGING IN

get '/users/login' do
  if session[:user_id] == nil
    @user = User.new
    @title = 'Login'
    erb :'users/login'
  else
    redirect '/users/show'
  end
end

post '/users/login' do # Login attempt
  user_attempt = User.authenticate(params[:user])
  if user_attempt.is_a?(User)
    session[:user_id] = user_attempt.id
    redirect "/users/show"
  else
    session[:login_error] = user_attempt
    redirect 'users/login'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect 'users/login'
end

# ------------ PROFILE PAGES

get '/users/show' do
  redirect 'users/login' if !session[:user_id]
  @user = User.find(session[:user_id])
  @title = @user.name
  @all_levels = SkillLevel.all
  erb :'users/private_view'
end

get '/users/show/:id' do
  @user = User.find(params[:id])
  @title = @user.name
  erb :'users/public_view'
end

# ------------ EDIT USER

get '/users/edit' do
  @user = current_user
  erb :'/users/edit'
end