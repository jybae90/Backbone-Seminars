jQuery ->
	class Stream extends Backbone.Model

	class StreamView extends Backbone.View
		tagName: 'li'
		template: _.template $('#todo-view').html()
		events:
			'click .delete': 'delete'

		render: ->
			@$el.html @template @model.toJSON()
			@$el.hide()
			@

		delete: ->
			@remove()
			@model.destroy()

	class StreamList extends Backbone.Collection
		model: Stream
		localStorage: new Backbone.LocalStorage 'streams'

	class AppView extends Backbone.View
		el: $ 'body'
		events:
			'click button': 'create'

		initialize: =>
			@streams = new StreamList
			@streams.on 'add', @addOne, @
			@streams.on 'reset', @addAll, @

		render: ->
			@streams.fetch()

		create: ->
			val = @$('textarea').val()
			if val.length > 0 then @streams.create text: @$('textarea').val()

		addOne: (model) ->
			streamView = new StreamView model: model
			@$('ul').append streamView.render().el
			streamView.$el.fadeIn('fast')

		addAll: ->
			@streams.each @addOne, @

	appView = new AppView
	appView.render()