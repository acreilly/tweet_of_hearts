get '/' do

  erb :index
end

#post signin

post '/login' do

end

#post signup
post '/users' do
  User.create(params)
  redirect '/'
end
