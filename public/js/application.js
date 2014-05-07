$(document).ready(function() {
	view = new View();
	controller = new Controller(view);
	controller.getGeoLocation();
	controller.checkPage();
});
