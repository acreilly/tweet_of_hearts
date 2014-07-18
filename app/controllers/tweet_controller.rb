post '/users/:id' do
  current_user.tweets.create(content: params[:content])
  redirect "/users/#{current_user.id}"
end
