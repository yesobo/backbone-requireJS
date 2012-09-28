define(['backbone'], (Backbone)->
	template = '<input type="text" placeholder="Write pattern name here!"/>'
	
	View = Backbone.View.extend(
			tagName: 'form'
			className: 'newPattern'
			render: ->
				@$el.html template
				@$input = @$("input")
				this
			events:
				'submit': (e)->
					e.preventDefault()
					@collection.create(
						name: @$input.val().trim()
						)
					@$input.val("");		
		)
	View
)