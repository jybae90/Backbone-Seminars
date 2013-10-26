jQuery ->
	class Stream extends Backbone.Model

	class StreamView extends Backbone.View
		tagName: 'li'
		template: _.template $('#stream-view').html()

		render: ->
			@$el.html @template @model.toJSON()
			@

	class AppView extends Backbone.View
		el: $ 'body'


