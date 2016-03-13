get '/surveys/:survey_id/questions/new' do
  @question = Question.new
  erb :'/questions/new', layout: false, locals: { survey_id: params[:survey_id] }
end

post '/surveys/:survey_id/questions' do
  @question = Question.new(name: params[:question][:name], survey_id: params[:survey_id] )
  if @question.save
    if request.xhr?
      erb :'questions/_question_partial', layout: false, locals: {question: @question}
    else
      p "this was a bad xhr"
      redirect "/surveys"
    end
  else
    erb :'empty', layout: false
  end
end



