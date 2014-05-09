class Event < ActiveRecord::Base
	after_save :update_kollisions
	belongs_to :user
	has_many :kollisions, source: :event
	has_many :kolliding_events, through: :kollisions, source: :kolliding_event

	def update_kollisions
		events = Event.all
		events.each do |event| 
			distance = Haversine.distance(self.latitude, self.longitude, event.latitude, event.longitude).to_miles
			self.kolliding_events << event if distance < 0.10
		end
	end

	def formatted_date
		self.created_at.strftime("%a %-m/%-d @%l%P" )
	end

end
