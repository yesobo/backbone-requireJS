define(
	['backbone','views/PatternView'], (Backbone, PatternView) ->
		separatorTmpl = _.template '<li class="nav-header"><%= category %></li>'
		View = Backbone.View.extend 
			tagName: 'ul'
			className: 'nav nav-list'
			initialize: ->
				@collection.on 'reset', @render, this
				@collection.on 'add', @add, this
			render: ->
				currentCategory = null;
				@collection.each (pattern) =>
					patternObj = pattern.toJSON()
					if patternObj.category != currentCategory
						@$el.append separatorTmpl(patternObj)
						currentCategory = patternObj.category
					child = new PatternView {model: pattern}
					@$el.append(child.render().$el).show()
				this
		View
)