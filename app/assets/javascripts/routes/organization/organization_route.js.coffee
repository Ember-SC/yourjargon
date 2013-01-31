YJ.OrganizationRoute = Ember.Route.extend(
#    route: '/:organization_id'
#    #EVENTS
#    newTerm: ((controller) ->
#      controller.transitionTo('terms.new')
#    )
# #    newTerm: @transitionTo('terms.new')
#    editTerm: ((controller) ->
#      controller.transitionTo('terms.edit')
#    )
# #    editTerm: @transitionTo('terms.edit')
#    viewTerms: ((controller) ->
#      controller.transitionTo('organization.show')
#    )
# #    viewTerms: @transitionTo('organization.show')
#    termCreated: ((controller, event) ->
#      organization = YJ.controller.get('organizationController.content')
#      controller.transitionTo('organizations.organization.show', organization)
#    )
#    toShow: ((controller, event) ->
#      controller.transitionTo('terms.show', event.context)
#    )

   setupController: (controller, model) ->
   	 controller.set('content', model)
)