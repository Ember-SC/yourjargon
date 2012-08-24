YJ.OrganizationsRoute = Ember.Route.extend(
  route: '/organizations'
  # EVENTS


  index: Ember.Route.extend(
    route: '/'
    # EVENTS



    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('organizations', YJ.Organization.find())
  )
)