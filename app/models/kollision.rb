class Kollision < ActiveRecord::Base
	belongs_to :event, class_name: "Event"
	belongs_to :kolliding_event, class_name: "Event"
end
