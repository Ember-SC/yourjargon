YJ.User = DS.Model.extend(
  name: DS.attr("string")
  email: DS.attr("string")
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

  membershipForOrganization: (organization) ->
    organization.membershipForUser(@)

  isOwner: (organization) ->
    @membershipForOrganization(organization).get("isOwner")
)
YJ.User.reopenClass(
  loadFromCookie: (api_key) ->
    self = @
    $.ajax
      url: "/users/#{api_key}"
      type: "GET"
      async: false
      dataType: 'json'
      success: (data) ->
        loaded = YJ.store.load(YJ.User, data.user)
        YJ.set('currentUser', YJ.User.find(loaded.id))
        true
      error: (data) ->
        false

)
