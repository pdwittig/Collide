function Factory(object) {
	this.object = object
}

Factory.prototype = {
	build_kollisions: function(kollision_data) {
		kollisions = []
		for(var i =0; i < kollision_data.length; i++) {
			kollisions.push(new Kollision(kollision_data[i]))
		}
		return kollisions
	}

}