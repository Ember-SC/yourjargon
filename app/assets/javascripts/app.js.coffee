Ember.Router.reopen(
  location:  Ember.computed ->
  	history = window.history
  	if ( history && "pushState" in history && "replaceState" in history )
  		"history"
  	else
  		"hash"
  .property()
)

###
  The creation of the Your Jargon ('YJ') namespace
###
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
