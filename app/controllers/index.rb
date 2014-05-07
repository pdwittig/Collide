get '/' do
  @user = get_user
  @kollisions = @user.get_kollisions if @user
  p @kollisions if @user
  erb :index
end

get '/linkedin_auth' do
  client = Linkedin::Client.new
  redirect client.get_auth_redirect_uri
end

get '/auth' do
  client = Linkedin::Client.new
  access_token = client.get_access_token params[:code]
  user_info = client.get_user_info(access_token)
  user = User.create_or_update(user_info, access_token)
  session[:id] = user.id
  redirect '/#home'
end

post '/events/new' do
  position = JSON.parse(params["position"])
  user = get_user
  event = user.events.create(latitude: position['latitude'], 
                             longitude: position['longitude'])
  content_type :json
  event
end



get '/sign_out' do
  session.clear
  redirect '/'
end



