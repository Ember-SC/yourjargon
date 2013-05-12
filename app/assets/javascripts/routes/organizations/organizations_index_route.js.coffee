YJ.OrganizationsIndexRoute = Ember.Route.extend(
   # route: '/'
   # # EVENTS
   # newTerm: ((controller, event) ->
   #   controller.transitionTo('terms.new')
   # )
   # # Treating events as properties is retarded
   # toOrganizationNew: ((controller) ->
   #   controller.transitionTo('new')
   # )
   # toEditOrganization: ((controller, event) ->
   #   controller.transitionTo('edit', event.context)
   # )
   # toOrganizationProfile: ((controller, event) ->
   #   controller.transitionTo('organization.profile', event.context)
   # )
   setupController: (controller) ->
   	controller.set('content', YJ.Organization.find(isPublic: true))

)