define(['backbone', 'text!views/templates/pattern.html'], (Backbone, templ) ->
	template  = _.template templ
	View = Backbone.View.extend(
		tagName: 'li'
		className: 'pattern'
		initilize: ->
		render: ->
			@$el.html template(@model.toJSON())
			this
	)
)