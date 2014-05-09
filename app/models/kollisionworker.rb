# class KollisionWorker
# 	include Sidekiq::Worker

# 	def update_kollisions(new_event)
# 		events = Event.all
# 		events.each do |event| 
# 			distance = Haversine.distance(new_event.latitude, new_event.longitude, event.latitude, event.longitude).to_miles
# 			new_event.kolliding_events << event if distance < 0.10
# 		end
# 	end
# end