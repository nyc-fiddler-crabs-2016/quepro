post '/surveys/:survey_id/surveys_taken' do
 if logged_in?
  @survey_taken = SurveysTaken.new(survey_id: params[:survey_id], user_id: current_user.id)
    if @survey_taken.save
    else
      p @survey_taken.errors
    end
      erb :'surveys/finish'
  else
    redirect '/login'
  end
end
