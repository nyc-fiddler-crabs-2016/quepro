get '/choices/new' do
  @question = Question.new
  erb :'/choices/new', layout:false
end

post '/choices' do
  @choice = Choice.new(name: params[:choice][:name], question_id: session[:question_id])

  if @choice.save
     session[:choice_id] = @choice.id
      if request.xhr?
        erb :'choices/_choice_partial', layout: false, locals: {choice: @choice}
      else
      redirect "/surveys"
      end
    else
      erb :"surveys/new"
    end
end
