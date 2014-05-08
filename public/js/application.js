$(document).ready(function() {
	view = new View();
	user = new User();
	factory = new Factory()
	controller = new Controller(view, user, factory);
	controller.getGeoLocation();
	controller.checkPage();
});
