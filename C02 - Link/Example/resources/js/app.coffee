jQuery ->
	class IntroView extends Backbone.View
		tagName: 'div'
		template: _.template $('#intro-template').html()

		render: ->
			@$el.html @template
			@$el.addClass('container').addClass('content')
			@

	class WorkView extends Backbone.View
		tagName: 'p'
		template: _.template $('#work-template').html()

		render: ->
			@$el.html @template
			@$el.addClass('container').addClass('content')
			@

	class AppView extends Backbone.View
		el: $ 'body'
		events:
			'click #btn-intro': 'showIntro'
			'click #btn-work': 'showWork'

		showIntro: ->
			introView = new IntroView
			@$('section').html introView.render().el

		showWork: ->
			workView = new WorkView
			@$('section').html workView.render().el

	new AppView