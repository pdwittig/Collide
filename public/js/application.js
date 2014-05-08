$(document).ready(function() {
	view = new View();
	user = new User();
	// kollision = new Kollision()
	factory = new Factory()
	controller = new Controller(view, user, factory);
	controller.getGeoLocation();
	controller.checkPage();
});
