helpers  do
	def get_user
		User.find session[:id] if session[:id]
	end
end