 get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password][:password_digest]
  # if request.xhr?
  #   @user = User.new(params[:user])
  #   response_object{id: @user.id, user_name: @user.user_name, password: @user.pasword}.to_json
  if @user.save
    session[:user_id] = @user.id

    redirect "/posts"
  else
    # redirect'/errors=couldnt_create_login'
    # @errors = @entry.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  if logged_in?
    erb :'users/show'
  else
     redirect '/login'
  end
end
