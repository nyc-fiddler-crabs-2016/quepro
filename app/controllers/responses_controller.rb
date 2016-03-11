post '/responses' do
  @responses = #Array of responses

    @responses.each do |response|
      Response.create(params[:response])
  end
end
