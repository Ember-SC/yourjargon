YJ.User = DS.Model.extend(
  name: DS.attr("string")
  email: DS.attr("string")
  memberships: DS.hasMany("YJ.Membership", embedded: true)

  organizations: (->
    @get('memberships').map (membership, index, memberships) ->
      membership.get('organization')
  ).property('memberships.@each.organization')

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
  loadFromCookie: (cookie) ->
    self = @
    promise = Ember.$.getJSON("/api/users/#{cookie}")
    promise.then((data)->
      loaded = YJ.store.load(YJ.User, data.user)
      YJ.set('currentUser', YJ.User.find(loaded.id))
    )
    promise
)
# Lets check for the user
promise = YJ.User.loadFromCookie(Ember.$.cookie('account'))
promise.then(->
  YJ.advanceReadiness()
, ->
  YJ.advanceReadiness()
)
