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

	confirmKollidEvent: function(response) {
		console.log(response)
	}

}