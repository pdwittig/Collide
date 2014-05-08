function View() {

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
	}

}