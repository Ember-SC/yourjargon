YJ.OrganizationsRoute = Ember.Route.extend(
  route: '/organizations'
  # EVENTS

  new: Ember.Route.extend(
    route: '/new'
    # EVENTS
    create: ((router, event) ->
       router.get('organizationNewController').create()
       router.send('toDashboard')
    )
    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('organizationNew', YJ.Organization.build(YJ.get('currentUser')))
  )

  index: Ember.Route.extend(
    route: '/'
    # EVENTS
    newTerm: ((router, event) ->
      router.transitionTo('terms.new')
    )
    # Treating events as properties is retarded
    toOrganizationNew: ((router) ->
      router.transitionTo('new')
    )
    toEditOrganization: ((router, event) ->
      router.transitionTo('edit', event.context)
    )
    toOrganizationProfile: ((router, event) ->
      router.transitionTo('organization.profile', event.context)
    )


    connectOutlets: ((router) ->
      router.get('applicationController').connectOutlet('organizations', YJ.Organization.find(isPublic: true))
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

  organization: Ember.Route.extend(
    route: '/:organization_id'
    #EVENTS
    newTerm: Ember.Route.transitionTo('terms.new')
    editTerm: Ember.Route.transitionTo('terms.edit')
    viewTerms: Ember.Route.transitionTo('organization.show')
    termCreated: ((router, event) ->
      organization = YJ.router.get('organizationController.content')
      router.transitionTo('organizations.organization.show', organization)
    )
    toShow: ((router, event) ->
      router.transitionTo('terms.show', event.context)
    )

    connectOutlets: ((router, context) ->
      router.get('organizationController').set('content', context)
    )

    profile: Ember.Route.extend(
      route: '/profile'

      connectOutlets: ((router) ->
        organizationController = router.get('organizationController')
        organization = organizationController.get('content')
        router.get('applicationController').connectOutlet('organizationProfile', organization)
      )
    )

    show: Ember.Route.extend(
      route: '/'

      connectOutlets: ((router) ->
        organizationController = router.get('organizationController')
        organization = organizationController.get('content')
        router.get('applicationController').connectOutlet('organization', organization)
        organizationController.connectOutlet(name: 'terms', outletName: 'orgTerms', context: organization.get('terms'))
      )

    )

    terms: YJ.TermsRoute
  )

)
