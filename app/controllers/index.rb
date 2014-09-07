require_relative '../models/skill_level'
# Eventually these requires should not be needed? All goes in the config file

get '/home' do
	@title = "Home"
	@all_levels = SkillLevel.all

	erb :home
end

post '/home' do
	"You said '#{params[:message]}'"
end

get '/' do
  session[:login_error] = nil

  redirect '/users/login'
end

