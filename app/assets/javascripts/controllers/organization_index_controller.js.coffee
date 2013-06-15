YJ.OrganizationIndexController = Ember.ObjectController.extend(
	join: ->
		controller = @
		model = @get('model')
		user = YJ.get('currentUser')
		membership = model.enroll(user)
		membership.once('didUpdate', ->
			controller.send(Alert.create(type: "SUCCESS", message: "You joined the organization"))
		)
		membership.once('becameError', ->
			controller.send(Alert.create(type: "ERROR", message: "An error occured"))
		)

		
)