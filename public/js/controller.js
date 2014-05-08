function Controller(view, user, factory) {
	this.view = view
	this.user = user
	this.factory = factory
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
		ajaxRequest.done(this.confirmKollideEvent)
	},

	confirmKollideEvent: function(response) {
		console.log(response)
	},

	getKollisions: function() {
		ajaxRequest = $.ajax({
			url: '/kollisions',
			type: 'get',
		})
		ajaxRequest.done(this.displayKollisions.bind(this))
	},

	displayKollisions: function(response) {
		kollisions = this.factory.build_kollisions(response);
		this.user.addKollisions(kollisions);
		this.view.renderKollisions(kollisions);
	},

	prepPositionData: function(position) {
		latitude = position.coords.latitude
		longitude = position.coords.longitude
		coords = { latitude: latitude, longitude: longitude }
		return JSON.stringify(coords)
	},

	checkPage: function() {
		if (window.location.hash === '#home') {
			this.getKollisions();
		}
	}

}