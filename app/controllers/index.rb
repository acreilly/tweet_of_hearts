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
    redirect '/'
  end
end

#post signup
post '/users' do
  User.create(params)
  redirect '/'
end

get '/users/:id' do

  erb :profile
end


post '/logout' do
  log_out
  redirect '/'
end
