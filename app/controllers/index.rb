get '/' do
  erb :index
end

get '/authenticate' do

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




