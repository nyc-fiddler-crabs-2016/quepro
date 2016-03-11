get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])

  if @question.save
      if request.xhr?
        erb :'partial to append to survey/new '
      else
      redirect "/surveys/new"
      end
    else
      erb :"surveys/new"
    end
end



