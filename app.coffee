###
Paths section
###
require.config(
	baseUrl: "C:/desarrollo/webdev/bbb-requireJS/js"
	paths: 
		jquery: 'lib/jquery-1.8.2'
		underscore: 'lib/underscore-1.3.3'
		backbone: 'lib/backbone-0.9.2'
		#'backbone.localStorage': 'lib/backbone.localStorage'
	shim:
		underscore:
			exports: "_"
		backbone:
			deps: ['underscore', 'jquery']
			exports: 'Backbone'
		#'backbone.localStorage':
		#	deps: ['backbone']
		#	exports: 'Backbone'
)
	
require [
	'jquery',	
	'backbone',
	'models/Pattern',
	'views/MasterView' 
	], ($, Backbone, Pattern, MasterView) ->
		Router = Backbone.Router.extend(
			routes:
				"": "main"
			main: ->
				patterns = new Pattern.Collection()
				view = new MasterView {collection: patterns}
				patterns.fetch(
					url: "http://localhost:8010/api/patterns"
					error: (collection, response) ->
						console.log 'error al hacer FETCH en app'
						console.log response
					success: (collection, response) ->
						console.log 'FETCH realizado correctamente'
						$('#Container').html(view.render().el).show()
				)
		)
		router = new Router()
		Backbone.history.start()