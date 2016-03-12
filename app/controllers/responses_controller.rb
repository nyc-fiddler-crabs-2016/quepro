post '/responses' do
  p "string"
  @responses = Response.new(question_id: session[:question_id], user_id: current_user.id, choice_id: session[:choice_id])
  p "string here"
    if @survey_taken.save
    session[:survey_taken_id] = @survey_taken.id
      p "Surveys Taken Complete"
      redirect "/surveys"
    else
      # "this didnt not save"
      # erb :"surveys/"
      # theres no error handling for not completing a
      #full survey, because we want to allow users to do it
    end
end
