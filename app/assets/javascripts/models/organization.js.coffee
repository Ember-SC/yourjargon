##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:30 PM
# To change this template use File | Settings | File Templates.
#

YJ.Organization = DS.Model.extend(
  name: DS.attr("string")
  ownership: DS.belongsTo("YJ.Membership")
  memberships: DS.hasMany("YJ.Membership")
  terms: DS.hasMany("YJ.Term")
  isPublic: DS.attr("boolean", defaultValue: false)

  ownedBy: (->
    @get('ownership.user')
  ).property()

  setOwner: (owner) ->
    membership = @get('ownership')
    membership.clearOwner() if membership != null
    # do we need to commit() here?
    membership = @enroll(owner)
    membership.setOwner()
    @set('ownership', membership)

  enroll: (user) ->
    memberships = @get('memberships')
    membership = memberships.findProperty('user', user)
    unless membership?
      membership = YJ.Membership.createRecord(user: user, organization: @)
      memberships.pushObject(membership)
    membership

  drop: (user) ->
    memberships = @get('memberships')
    membership = memberships.findProperty('user', user)
    memberships.removeObject(membership)

  publish: (term) ->
    terms = @get('terms')
    terms.pushObject(term)

  setPublic: ->
    @set('isPublic', true)



)
YJ.Organization.reopenClass(

  # Be sure you add the name of the organization before you commit
  build: (owner) ->
    organization = YJ.Organization.createRecord()
    organization.setOwner(owner)
    organization
)
