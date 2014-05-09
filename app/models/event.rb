class Event < ActiveRecord::Base
	after_create :update_kollisions
	belongs_to :user
	has_many :kollisions, source: :event
	has_many :kolliding_events, through: :kollisions, source: :kolliding_event

	def formatted_date
		self.created_at.strftime("%a %-m/%-d @%l%P" )
	end

	def update_kollisions
		events = Event.all
		events.each do |event| 
			distance = Haversine.distance(self.latitude, self.longitude, event.latitude, event.longitude).to_miles
			time_span = self.created_at - event.created_at
			if distance < 0.05 && time_span < 5
				self.kolliding_events << event 
			end
		end
	end
end
