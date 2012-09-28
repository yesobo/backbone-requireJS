define(['backbone'], (Backbone) ->
	template  = _.template '<p><%= name %></p>'
	View = Backbone.View.extend(
		tagName: 'li'
		className: 'pattern'
		initilize: ->
		render: ->
			console.log  'rendering patternview'
			console.log @model
			@$el.html template(@model.toJSON())
			this
	)
)