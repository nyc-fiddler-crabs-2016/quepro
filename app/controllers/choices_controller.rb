get '/questions/:question_id/choices/new' do
  erb :'/choices/new', layout:false, locals: { question_id: params[:question_id] }
end

post '/questions/:question_id/choices' do
  @choice = Choice.new(name: params[:choice][:name], question_id: params[:question_id])

  if @choice.save
    if request.xhr?
      erb :'choices/_choice_partial', layout: false, locals: {choice: @choice}
    else
      redirect "/surveys"
    end
  else
    erb :'empty', layout: false
  end
end
