YJ.User = DS.Model.extend(
  name: DS.attr("string")
  email: DS.attr("string")
  password: DS.attr("string") # Filter me on server

  memberships: DS.hasMany("YJ.Membership")

  organizations: (->
    @get('memberships').map(item, index, self) ->
      item.get('organization')
  ).property

  join: (organization) ->
    organization.enroll(@)
)
