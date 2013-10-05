jQuery ->
		class AboutView extends Backbone.View
			tagName: 'p'
			template: _.template $('#about-template').html()

			render: ->
				@$el.html @template
				@$el.addClass('menu').addClass('content')
				@

		class Sangsangmun1dongView extends Backbone.View
			tagName: 'p'
			template: _.template $('#sangsangmun1dong-template').html()

			render: ->
				@$el.html @template
				@$el.addClass('menu').addClass('content')
				@

		class AppView extends Backbone.View
			el: $ 'body'
			events:
				'click #about': 'showAbout'
				'click #sangsangmun1dong': 'showSangsangmun1dong'

			showAbout: ->
				aboutView = new AboutView
				@$('section').html aboutView.render().el

			showSangsangmun1dong: ->
				sangsangmun1dongView = new Sangsangmun1dongView
				@$('section').html sangsangmun1dongView.render().el

		new AppView
