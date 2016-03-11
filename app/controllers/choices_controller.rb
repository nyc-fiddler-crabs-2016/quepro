get '/choices/new' do
  erb :'/choices/new'
end

post '/choices' do
  @choice = Choice.new(params[:choice])

  if @choice.save
      if request.xhr?
        erb :'partial to append to survey/new '
      else
      redirect "/surveys/new"
      end
    else
      erb :"surveys/new"
    end
end
