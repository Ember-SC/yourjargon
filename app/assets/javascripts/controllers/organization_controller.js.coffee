YJ.OrganizationController = Ember.ArrayController.extend(
  content: []

  add: (name, owner) ->
    organization = YJ.Organization.createRecord(name: name)
    organization.setOwner(owner)
    @get('content').pushObject(organization)
    organization

)