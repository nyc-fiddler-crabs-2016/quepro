get '/questions/new' do
  @question = Question.new
  erb :'/questions/new', layout: false
end

post '/questions' do
  @question = Question.new(name: params[:question][:name], survey_id: session[:survey_id] )
  if @question.save
    session[:question_id] = @question.id
    if request.xhr?
      erb :'questions/_question_partial', layout: false, locals: {question: @question}
    else
      p "this was a bad xhr"
      redirect "/surveys"
    end
  else
    erb :"surveys/new"
  end
end



