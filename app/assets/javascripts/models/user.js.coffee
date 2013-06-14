YJ.User = DS.Model.extend(
  name: DS.attr("string")
  email: DS.attr("string")
  memberships: DS.hasMany("YJ.Membership")
  organizations: Ember.computed ->
    if memberships = @get('memberships').filterProperty('relationshipsLoaded', true)
      memberships.getEach('organization')
  .property('memberships.@each.relationshipsLoaded')

  createOrganization: (name) ->
    org = YJ.Organization.createRecord(name: name)
    org.setOwner(@)
    org

  join: (organization) ->
    organization.enroll(@)

  leave: (organization) ->
    organization.drop(@)

  membershipForOrganization: (organization) ->
    organization.membershipForUser(@)

  isOwner: (organization) ->
    membership = @memberships.findProperty('organization_id', organization.get('id'))
    if membership
      membership.get('isOwner')
    else
      false
)

