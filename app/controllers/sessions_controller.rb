get '/login' do
  @user = User.new
  erb :'/login'
end

post '/login' do
  @user = User.find_by(user_name: params[:user][:user_name])
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect "/things" #pay attention to me !
  else
    @user = User.new(params[:user])
    @errors = ["Either the name or password was incorrect."]
    erb :'/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
