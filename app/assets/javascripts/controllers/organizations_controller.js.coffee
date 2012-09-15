YJ.OrganizationsController = Ember.ArrayController.extend(
  content: []

  create: (name, owner) ->
    organization = YJ.Organization.create(name, owner)
    @get('content').pushObject(organization)
    organization

)
