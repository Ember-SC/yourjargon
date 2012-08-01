YJ.OrganizationController = Ember.ArrayController.extend(
  content: null

  add: (name, owner) ->
    organization = YJ.Organization.createRecord(name: name)
    organization.ownedBy(owner)
)