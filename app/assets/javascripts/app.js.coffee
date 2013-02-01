###
  The creation of the Your Jargon ('YJ') namespace
###
Ember.Router.reopen(
  location: 'history'
)

window.YJ = Em.Application.create(
  LOG_TRANSITIONS: true

)

YJ.store = DS.Store.create(
  revision: 11
  adapter: DS.RESTAdapter.create(bulkCommit: false)
)

YJ.reopen(
  createUser: (name, email) ->
    YJ.User.createRecord(name: name, email: email)
)

YJ.searchTerm = Em.Object.create(term: null)

