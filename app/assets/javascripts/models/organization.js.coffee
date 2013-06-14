##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:30 PM
# To change this template use File | Settings | File Templates.
#

YJ.Organization = DS.Model.extend(
  name: DS.attr("string")
  users: DS.hasMany("YJ.User",
    inverse: 'organizations'
  )
  terms: DS.hasMany("YJ.Term")
  owner: DS.belongsTo("YJ.User")

  isMember: Ember.computed ->
    @get('users').someProperty('id', YJ.get('currentUser.id'))
  .property('users')

  enroll: (user) ->
    @get('users').pushObject(user)
    user

  drop: (user) ->
    @get('users').removeObject(user)

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

  definedTerms: (->
    @get('terms').filterProperty("isDefined", true)
  )

  undefinedTerms: (->
    @get('terms').filterProperty("isDefined", false)
  )

)
YJ.Organization.reopenClass(
  # Be sure you add the name of the organization before you commit
  build: (owner) ->
    org = YJ.Organization.createRecord(owner: owner)
    org.enroll(owner)
    org.get('transaction').commit()
    org
)
