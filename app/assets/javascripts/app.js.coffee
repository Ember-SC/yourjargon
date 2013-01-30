###
  The creation of the Your Jargon ('YJ') namespace
###
exports = this

Ember.Router.reopen(
  location: 'history'
)

window.YJ = Em.Application.create(

)

YJ.store = DS.Store.create(
  revision: 11
  LOG_TRANSITIONS: true
  adapter: DS.RESTAdapter.create(bulkCommit: false)
)



YJ.initialize()

YJ.reopen(
  createUser: (name, email) ->
    YJ.User.createRecord(name: name, email: email)
)

YJ.searchTerm = Em.Object.create(term: null)

