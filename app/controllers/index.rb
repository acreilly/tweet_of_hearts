get '/' do
  erb :index
end

# before do
#   redirect '/' unless logged_in?
# end

#post signin
post '/sessions' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
  end

  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    flash[:error] = "Your username or password is incorrect!"
    redirect '/'
  end
end

#post signup
post '/users' do
  User.create(params)
  user = User.find_by(email: params[:email])
  session[:user_id] = user.id
  redirect "/users/#{current_user.id}"
end

get '/users/:user_id' do
  @target_user = User.find(params[:user_id])
  erb :homepage
end

post '/logout' do
  log_out
  redirect '/'
end

get '/profiles/:user_id' do
  @target_user = User.find(params[:user_id])
  erb :profile
end

post '/following/:user_id' do
  p current_user
  current_user.followers << User.find(params[:user_id])
  redirect "/profiles/#{params[:user_id]}"
end
