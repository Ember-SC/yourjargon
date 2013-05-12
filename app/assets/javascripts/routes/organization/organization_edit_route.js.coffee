YJ.OrganizationEditRoute = Ember.Route.extend(
   # route: '/edit/:organization_id'
   # save: ((controller,context) ->
   #   controller.get('organizationEditController').save()
   #   controller.transitionTo('index')
   # )
   setupController: (controller, model) ->
     controller.get('applicationController').connectOutlet('organizationEdit', model)

)