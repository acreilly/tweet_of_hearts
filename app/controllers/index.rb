get '/' do

  erb :index
end

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
  redirect '/'
end

get '/users/:id' do
  @current_page = params[:id]
  erb :profile
end

post '/logout' do
  log_out
  redirect '/'
end

### create serperate followers page IF THERE IS TIME
# get '/users/:id/followers' do

#   erb :followers_page
# end

### create serperate following page IF THERE IS TIME
# get '/users/:id/following' do

#   erb :following_page
# end
