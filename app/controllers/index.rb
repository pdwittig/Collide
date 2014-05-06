get '/' do
  erb :index
end

get '/authenticate' do
  api_key = ENV['LINKEDIN_API_KEY']
  puts "this is my api key#{api_key}"
  scope = 'r_basicprofile%20r_emailaddress'
  state = "sdk304;sdk344"
  redirect_uri = "http://localhost:9393/users/token"
  request_uri = "https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=#{api_key}&scope=#{scope}&state=#{state}&redirect_uri=#{redirect_uri}"
  p request_uri
  redirect to request_uri
end

get 'users/new' do
  user = User.new email: params[:email]
  user.password = params[:password]
  if user.valid?
    user.save
    content_type :json
    user.to_json
  else
    status 422
    content_type :json
    { errors: user.errors.full_massages }.to_json
  end
end




