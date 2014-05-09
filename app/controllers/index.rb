get '/' do
  @user = get_user
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

get '/kollisions' do
  user = get_user
  content_type :json
  user.get_kollisions_json(params[:page].to_i, 20)
end


get '/sign_out' do
  session.clear
  redirect '/'
end



