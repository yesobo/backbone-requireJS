define(
	['underscore',
	'backbone' 
	#'backbone.localStorage',
	], (_, Backbone) ->
		Pattern = Backbone.Model.extend(
				url: 'js/models/patterns'
				validate: (attrs) ->
					if _.isEmpty(attrs.name) then "Missing Name"
			)
		Patterns = Backbone.Collection.extend(
				#localStorage: new Backbone.LocalStorage(window.store || "Patterns")
				model: Pattern
				url: 'js/models/patterns'
				completed: ->
					@where {completed: true}
				remaining: ->
					@where {completed: false}
				comparator: (model)->
					model.get 'name'
			)
		{
			Model: Pattern
			Collection: Patterns
		}
)