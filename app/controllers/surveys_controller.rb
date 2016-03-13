get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'surveys/new'
end


post '/surveys' do
  p "string"
  @survey = Survey.new(params[:survey])
  @survey.user_id = current_user.id
  p "string here"
    if @survey.save
    session[:survey_id] = @survey.id
      p "made it to survey .save"
      if request.xhr?
        p "this saved to the page"
        erb :'surveys/_title_partial', layout: false, locals: {survey: @survey}
      else
      redirect "/surveys"
      end
    else
      "this didnt not save"
      erb :"surveys/new"
    end
end

get '/surveys/stats/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/stats'
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end

