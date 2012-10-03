##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:30 PM
# To change this template use File | Settings | File Templates.
#

YJ.Organization = DS.Model.extend(
  name: DS.attr("string")
  memberships: DS.hasMany("YJ.Membership", embedded: true)
  terms: DS.hasMany("YJ.Term", embedded: true)

  ownership: (->
    membership = @get('memberships').findProperty('isOwner', true)
  ).property('memberships.@each.isOwner')

  # FIXME: We aren't doing anything with 'public' organizations yet; maybe never
  isPublic: DS.attr("boolean", defaultValue: false)

  membershipForUser: (user) ->
    membership = @get('memberships').findProperty('user', user)
    membership

  ownedBy: (->
    @get('ownership.user')
  ).property('ownership')

  setOwner: (owner) ->
    membership = @get('ownership')
    membership.clearOwner() if membership != undefined
    # do we need to commit() here?
    membership = @enroll(owner)
    membership.setOwner()

  enroll: (user) ->
    memberships = @get('memberships')
    membership = @membershipForUser(user)
    unless membership?
      membership = YJ.Membership.createRecord(user: user, organization: @)
      membership.set('isOwner', false)
      memberships.pushObject(membership)
    membership

  drop: (user) ->
    memberships = @get('memberships')
    membership = memberships.findProperty('user', user)
    memberships.removeObject(membership)

  publish: (term) ->
    terms = @get('terms')
    terms.pushObject(term)
    term

  publishDefinedTerm: (name, definition) ->
    term = YJ.Term.createRecord(organization: @, name: name, description: definition)
    @publish(term)

  publishUndefinedTerm: (name) ->
    term = YJ.Term.createRecord(organization: @, name: name)
    @publish(term)

  setPublic: ->
    @set('isPublic', true)


  definedTerms: (->
    @get('terms').filterProperty("is_defined", true)
  )

  undefinedTerms: (->
    @get('terms').filterProperty("is_defined", false)
  )

)
YJ.Organization.reopenClass(

  # Be sure you add the name of the organization before you commit
  build: (owner) ->
    organization = YJ.Organization.createRecord()
    organization.setOwner(owner)
    organization
)
