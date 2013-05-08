YJ.ApplicationController = Ember.Controller.extend(
	alertsHistory: []
	alert: null
	alertObserver: ( ->
		self = @
		alert = @get('alert')
		if alert
			Ember.run.later (->
				self.call(self, clearAlert)
			), 15000
	).observes('alert')
	clearAlert: ->
		alert = @get('alert')
		if alert
			@get('alertsHistory').pushObject(alert)
			@set('alert', null)
)