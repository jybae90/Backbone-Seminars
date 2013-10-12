jQuery ->
	class ShotsView extends Backbone.View
		tagName: 'div'
		template: _.template $('#shots-template').html()

		render: ->
			@$el.html @template
			@$el.addClass('container').addClass('content')
			@

	class ExploreView extends Backbone.View
		tagName: 'div'
		template: _.template $('#explore-template').html()

		render: ->
			@$el.html @template
			@$el.addClass('container').addClass('content')
			@

	class AppView extends Backbone.View
		el: $ 'body'
		events:
			'click #btn-shots': 'showShots'
			'click #btn-explore': 'showExplore'

		showShots: ->
			shotsView = new ShotsView
			@$('section').html shotsView.render().el

		showExplore: ->
			exploreView = new ExploreView
			@$('section').html exploreView.render().el

	new AppView
