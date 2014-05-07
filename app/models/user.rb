class User < ActiveRecord::Base
  has_many :events

  def self.create_or_update user_info, access_token
  	user = self.find_by_email user_info["emailAddress"]
  	if !user
  		user = self.create( first_name: user_info["firstName"],
  								 				last_name: user_info["lastName"],
  												email: user_info["emailAddress"],
  								 				img_url: user_info["pictureUrl"],
  								 				access_token: access_token )
  	else
  		user.update_attributes( first_name: user_info["firstName"],
  								 						 last_name: user_info["lastName"],
  								 						 email: user_info["emailAddress"],
  								 						 img_url: user_info["pictureUrl"],
  								 						 access_token: access_token )
  	end
  	return user
  end

  def get_kollisions
    self.events.map { |event| event.find_kollisions }.uniq.flatten
  end
end



