post '/surveys/:survey_id/surveys_taken' do
  p "string"
  p session[:survey_id]
  @survey_taken = SurveysTaken.new(survey_id: params[:survey_id], user_id: current_user.id)
  # binding.pry

if @survey_taken.save

  p "string here"
else
    # if @survey_taken.save
    p @survey_taken.errors
          # params[:response].each do |question, choice|
      #   Response.create(user_id: current_user.id, question_id: question, choice_id: choice)

      #   end
    # session[:survey_taken_id] = @survey_taken.id
      # p "Surveys Taken Complete"
      # binding.pry
    end
      redirect "/surveys"
    # else
      # "oops"
      # "this didnt not save"
      # erb :"surveys/"
      # theres no error handling for not completing a
      #full survey, because we want to allow users to do it
end
