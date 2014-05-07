function Controller(view) {
	this.view = view
}

Controller.prototype = {
	getGeoLocation: function() {
		if (navigator.geolocation) {
			console.log(navigator.geolocation)
			navigator.geolocation.getCurrentPosition(this.createKollideEvent.bind(this));
		}
	},

	createKollideEvent: function(position) {
		// LINDSEY COMMENT: So far all of your variable and function/method naming is AWESOME, but "preppedPosition" is the first place where I don't immediately know what that means / what the variable is for. Maybe consider renaming?
		preppedPosition = this.prepPositionData(position)
		ajaxRequest = $.ajax({
			url: 'events/new',
			type: "post",
			data: {position: preppedPosition}
		})
		ajaxRequest.done(this.confirmKollidEvent)
	},

	prepPositionData: function(position) {
		latitude = position.coords.latitude
		longitude = position.coords.longitude
		coords = { latitude: latitude, longitude: longitude }
		return JSON.stringify(coords)
	},

// LINDSEY COMMENT: Missing an 'e' in Kollide :)
	confirmKollidEvent: function(response) {
		console.log(response)
	}

}