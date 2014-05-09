class User < ActiveRecord::Base
  has_many :events
  has_many :kolliding_events, through: :events
  has_many :kolliding_friends, through: :kolliding_events, source: :user

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

  def get_kollisions_json page, kollisions_per_page
    offset = kollisions_per_page * (page - 1) 
    kolliding_events = self.kolliding_events.limit(kollisions_per_page).offset(offset)
    users = User.all

    kolliding_events.map do |kollision|
      { first_name:     users.find { |user| kollision.user_id = user.id }.first_name,
        last_name:      users.find { |user| kollision.user_id = user.id }.last_name,
        img_url:        users.find { |user| kollision.user_id = user.id }.img_url,
        formatted_date: kollision.formatted_date
      }
    end.to_json
  end
end



