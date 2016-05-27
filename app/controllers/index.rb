

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users/new' do
  erb :registration
end

post '/tweet' do
  @user_id = session[:user_id]
  @tweet = Tweet.new(content: params[:submit_tweet], user_id: @user_id)
  unless @tweet.save
    @errors = @tweet.errors.messages[:content].first
    session[:errors] =  @errors
    session[:error_view_count] = 1
  end
  redirect "/users/#{@user_id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_page
end

get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/users/new' do
  @new_user = User.new(params[:user])
  if @new_user.save
    redirect "users/#{@new_user.id}"
  else
    @error_message = @new_user.errors.messages
    erb :error
  end
end

post '/users/new/redirect' do
  # @user = User.find_by(user_name: params[:user_name]) # why broken?
  @user = User.where(user_name: params[:user_name]).first

  if @user
  # binding.pry
  if @user.password == params[:password]
      # session[:visit] = 0
      session[:user_id] = @user.id
      session[:user_name] = @user.user_name

      # p session
      # p session[:session_id]
      erb :user_page
      # redirect "/users/#{@user.id}"
    else
      redirect '/'
    end
  else
    redirect '/'
  end

end
