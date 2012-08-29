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


    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('organizations', YJ.Organization.find())
  )



  show: Ember.Route.extend(
    route: '/show'
    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('organization', YJ.Organization.find())
  )
)
