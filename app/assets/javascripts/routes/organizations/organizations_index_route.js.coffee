YJ.OrganizationsIndexRoute = Ember.Route.extend(
  model: ->
    YJ.Organization.find(isPublic: true)
)