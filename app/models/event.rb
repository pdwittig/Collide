class Event < ActiveRecord::Base
	belongs_to :user
	has_many :kollisions, source: :event
	has_many :kolliding_events, through: :kollisions, source: :kolliding_event

		# def find_kollisions
	# 	events = Event.all
	# 	kollisions = events.select do |event| 
	# 		Haversine.distance(self.latitude, self.longitude, event.latitude, event.longitude).to_miles < 0.5
	# 	end
	# end

	def formatted_date
		self.created_at.strftime("%a %-m/%-d @%l%P" )
	end

end
