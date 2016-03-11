get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'surveys/new'
end


post '/surveys' do
  @survey = Survey.new(title: params[:title], user_id: current_user.id)

    if @survey.save
      if request.xhr?
        erb :'partial here '
      else
      redirect "/surveys"
      end
    else
      erb :"surveys/new"
    end
end


get '/surveys/:id'
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end

