get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users/new' do
  erb :registration
end

get '/users/:id' do
  @user = User.find(params[:id])

  erb :user_page
end

get '/login' do

  erb :login
end

post '/users/new' do
  @new_user = User.new(params[:user])
  if @new_user.save!
    redirect "users/#{@new_user.id}"
  else
    @error_message = @new_user.errors.messages
    redirect '/'
  end
end

post '/users/new/redirect' do
  p params[:user_name]
  # @user = User.find_by(user_name: params[:user_name])
  @user = User.where(user_name: params[:user_name]).first
  p @user
  if @user
    if @user.password == params[:password]
      redirect "/users/#{@user.id}"
    else
      redirect '/'
    end
  else
    redirect '/'
  end


end
