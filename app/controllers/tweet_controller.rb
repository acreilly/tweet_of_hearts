post '/users/:id' do
  current_user.tweets.create(content: params[:content])
  erb :tweet_page
  redirect "/users/#{current_user.id}"
end
