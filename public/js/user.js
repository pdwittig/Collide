function User() {
	this.kollisions = []
}

User.prototype = {
	addKollisions: function(kollisions) {
		for(var i = 0; i < kollisions.length; i++){
			this.kollisions.push(kollisions[i])
		}
	}
}