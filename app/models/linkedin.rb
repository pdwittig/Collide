module Linkedin
	class Client
		def initialize
			### LINDSEY COMMENT: If you haven't already, think ahead about what the redirect URI will be once you've deployed (would this just be '/auth'?)
			@redirect_uri = 'http://localhost:9393/auth'
			@base_auth_uri = 'https://www.linkedin.com/uas/oauth2/authorization?'
			@base_people_uri = 'https://api.linkedin.com/v1/people/~'
		end

		def get_auth_redirect_uri
			query =  { response_type: 'code',
             		 client_id:      ENV['LINKEDIN_API_KEY'],
             		 scope:         'r_basicprofile%20r_emailaddress',
                 state:         'sdk304;sdk344',
                 redirect_uri:  @redirect_uri }
  		request_uri = @base_auth_uri + query.map { |k,v| "#{k}=#{v}"}.join("&")

		end

		def get_access_token auth_code
			response = RestClient.post('https://www.linkedin.com/uas/oauth2/accessToken',
																{
																	grant_type: 		'authorization_code',
																	code: 					auth_code,
																	redirect_uri: 	@redirect_uri,
																	client_id: 			ENV['LINKEDIN_API_KEY'],
																	client_secret: 	ENV['LINKEDIN_API_SECRET']
																},
																accept: :json )
			access_token = JSON.parse(response.body)['access_token']
		end

		def get_user_info access_token
			fields = ['first-name', 'last-name', 'email-address', 'picture-url']
			request_uri = "#{@base_people_uri}:(#{fields.join(',')})"
			response = RestClient.get(request_uri , params:
																{ 
																	oauth2_access_token: access_token,
																	format: "json"
																})
			user_info = JSON.parse(response.body)
		end
	end
end