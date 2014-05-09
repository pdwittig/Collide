function View() {
	this.documentHeight = 0
}

View.prototype = {
	renderKollisions: function(kollisions) {
		kollisionsContainer = $('.kollisions')
		for(var i = 0; i< kollisions.length; i++){
			kollisionTemplate = $('.template').clone()
			kollisionTemplate.removeClass('hidden')
			kollisionTemplate.removeClass('template')
			this.replaceValues(kollisionTemplate, kollisions[i])
			kollisionsContainer.append(kollisionTemplate)
		}
	},

	replaceValues: function(template, kollision) {
		template.find('.kollision-date').replaceWith(kollision.formattedDate)
		template.find('.kollision-friend-img').replaceWith('<img src="' + kollision.imgUrl +'" alt="user image">')
		template.find('.kollision-friend-name').replaceWith(kollision.firstName + ' ' + kollision.lastName)
	},

	getDocHeight: function() {
		return $(document).height()
	},

	getWindowHeight: function() {
		return $(window).height();
	},

	getScrollTop: function() {
		return $(document).scrollTop();
	}
}