get '/' do

  erb :index
end

#post signin

post '/sessions' do
  user = User.find_by(email: params[:email])
  session[:id] = user.id if user.password == params[:password] && user
  if logged_in?
    redirect '/users/:id'
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
