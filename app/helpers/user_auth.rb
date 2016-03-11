  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
   current_user != nil
  end

  def authenticate!
    if !logged_in?
      redirect "/posts"
    end
  end


