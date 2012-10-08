define([
		'backbone'
		'views/NewPattern'
		'views/PatternListView'
		'text!views/templates/navBar.html'
	], (Backbone, NewPattern, PatternListView, navBar) ->
		View = Backbone.View.extend(
				className: 'masterView'
				el: 'body'
				initialize: ->
					console.log 'assigning views to children'
					@children =
						patternList: new PatternListView {collection: @collection}
						newPattern: new NewPattern {collection: @collection}
						#footerView: new FooterView {collection: @collection}
					console.log 'hiding el'
					@$el.hide()
					@$el.append navBar
					@$el.append @children.newPattern.render().el
					@$el.append @children.patternList.render().el
					#@$el.append @children.footerView.render().el
				render: ->
					@$el.show()
					this
		)
)