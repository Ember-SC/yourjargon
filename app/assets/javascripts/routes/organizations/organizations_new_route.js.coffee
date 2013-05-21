YJ.OrganizationsNewRoute = Ember.Route.extend(
  model: ->
    YJ.Organization.build(YJ.get('currentUser'))
)