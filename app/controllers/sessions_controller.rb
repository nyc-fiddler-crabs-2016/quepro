get '/login' do
  @user = User.new
  erb :'/login'
end

post '/login' do
  @user = User.find_by(params[:user])
  if @user && @user.authenticate(params[:password][:password_digest])
    session[:user_id] = @user.id
    redirect "/posts"
  else
    @user = User.new(params[:user])
    @errors = ["Either the name or password was incorrect."]
    erb :'/login'
  end
end

get '/logout' do
  session.clear
  redirect '/posts'
end