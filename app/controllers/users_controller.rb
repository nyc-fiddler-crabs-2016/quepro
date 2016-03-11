 get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  # if request.xhr?
  #   @user = User.new(params[:user])
  #   response_object{id: @user.id, user_name: @user.user_name, password: @user.pasword}.to_json
  if @user.save
    redirect '/login'
  else
    # redirect'/errors=couldnt_create_login'
    # @errors = @entry.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:user_id' do
  # @user = current_user
  # @entries = @user.entries
  if logged_in?
    erb :'users/show'
  else
     redirect '/login'
  end
end