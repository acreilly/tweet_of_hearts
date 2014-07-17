get '/tweets' do

erb :tweet_page
end

post '/tweets' do
  Tweet.create(content: params[:content], user_id: session[:user_id])
  erb :tweet_page
  # redirect '/tweets'
end


# post 'users/:user_id/tweets' do
#   Tweet.new(content: params[:content], user_id: session[:user_id])
#   erb :tweet_page
# end
