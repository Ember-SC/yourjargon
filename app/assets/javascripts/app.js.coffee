###
  The creation of the Your Jargon ('YJ') namespace
###

Ember.Router.reopen(
  location:  Ember.computed ->
  	history = window.history
  	if ( history && "pushState" of history )
  		"history"
  	else
  		"hash"
  .property()
)

window.YJ = Em.Application.create(
  LOG_TRANSITIONS: true

)

YJ.store = DS.Store.create(
  revision: 12
  adapter: DS.RESTAdapter.create(bulkCommit: false, namespace: 'api')
)

YJ.reopen(
  createUser: (name, email) ->
    YJ.User.createRecord(name: name, email: email)
)

YJ.searchPhrase = ''

