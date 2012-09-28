YJ.OrganizationsRoute = Ember.Route.extend(
  route: '/organizations'
  # EVENTS

  new: Ember.Route.extend(
    route: '/new'
    # EVENTS
    create: ((router, event) ->
       router.transitionTo('index')
    )
    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('organizationNew', YJ.Organization.build(YJ.get('currentUser')))
  )

  index: Ember.Route.extend(
    route: '/'
    # EVENTS
    # Treating events as properties is retarded
    toOrganizationNew: ((router) ->
      router.transitionTo('new')
    )
    toEditOrganization: ((router, event) ->
      router.transitionTo('edit', event.context)
    )


    connectOutlets: ((router) ->
      router.get('applicationController').connectOutlet('organizations', YJ.Organization.find())
    )
  )

  edit: Ember.Route.extend(
    route: '/edit/:organization_id'
    save: ((router,context) ->
      router.get('organizationEditController').save()
      router.transitionTo('index')
    )
    connectOutlets: ((router, context) ->
      router.get('applicationController').connectOutlet('organizationEdit', context)
    )
  )

  show: Ember.Route.extend(
    route: '/:organization_id'
    #EVENTS
    toShow: ((router, event) ->
      router.transitionTo('terms.show', event.context)
    )

    connectOutlets: ((router, context) ->
      router.get('applicationController').connectOutlet('organization', context)
    )
  )
)
