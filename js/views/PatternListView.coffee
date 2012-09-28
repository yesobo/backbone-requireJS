define(
	['backbone','views/PatternView'], (Backbone, PatternView) ->
		View = Backbone.View.extend 
			tagName: 'ul'
			className: 'patternList'
			initialize: ->
				@collection.on 'reset', @render, this
				@collection.on 'add', @add, this
			render: ->
				#@$el.empty().hide()
				#@collection.each @add, this
				console.log 'collection:'
				console.log @collection
				@collection.each (pattern) =>
					console.log 'creando new pattern con model='
					console.log pattern
					child = new PatternView {model: pattern}
					console.log 'añadiendo patternview a'
					console.log @$el
					@$el.append(child.render().$el).show()
				this
		View
)