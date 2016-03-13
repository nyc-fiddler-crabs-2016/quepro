get '/surveys' do
  @surveys = Survey.published
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
      p "made it to survey .save"
      if request.xhr?
        p "this saved to the page"
        erb :'surveys/_title_partial', layout: false, locals: {survey: @survey}
      else
      redirect "/surveys"
      end
    else
      # errors = @survey.full_messages
      erb :'empty', layout: false
    end
end

post '/surveys/:id/mark_complete' do
  @survey = Survey.find(params[:id])
  @survey.update_attributes(is_complete: true)
  redirect "/"
end

get '/surveys/stats/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/stats'
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end

