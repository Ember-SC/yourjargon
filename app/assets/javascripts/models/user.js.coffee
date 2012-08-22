YJ.User = DS.Model.extend(
  name: DS.attr("string")
  email: DS.attr("string")
  password: DS.attr("string") # Filter me on server

  memberships: DS.hasMany("YJ.Membership")

  organizations: (->
    @get('memberships').map(item, index, self) ->
      item.get('organization')
  ).property

  createOrganization: (name) ->
    org = YJ.Organization.createRecord(name: name)
    org.setOwner(@)
    org

  join: (organization) ->
    organization.enroll(@)

  leave: (organization) ->
    organization.drop(@)
)
