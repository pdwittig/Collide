class User < ActiveRecord::Base
  has_many :events

  def self.create_or_update user_info, access_token
  	user = self.find_by_email user_info["emailAddress"]
  	if !user
      ### LINDSEY COMMENT: can the first three just be combined into params, and then specify the other three attributes? E.g. self.create(params, img_url: user_info["pictureUrl"], etc.)
  		user = self.create( first_name: user_info["firstName"],
  								 				last_name: user_info["lastName"],
  												email: user_info["emailAddress"],
  								 				img_url: user_info["pictureUrl"],
  								 				access_token: access_token )
  	else
      ### LINDSEY COMMENT: Same as line 7 comment
  		user.update_attributes( first_name: user_info["firstName"],
  								 						 last_name: user_info["lastName"],
  								 						 email: user_info["emailAddress"],
  								 						 img_url: user_info["pictureUrl"],
  								 						 access_token: access_token )
  	end
  	return user
  end
end



