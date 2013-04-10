YJ.OrganizationsNewRoute = Ember.Route.extend(
   # events:
	  #  create: ((controller, event) ->
	  #     controller.get('organizationNewController').create()
	  #     controller.send('toDashboard')
	  #  )

   setupController: (controller) ->
   	 controller.setContentNewOrganization()

)