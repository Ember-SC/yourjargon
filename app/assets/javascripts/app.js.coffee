###
  The creation of the Your Jargon ('YJ') namespace
###
exports = this

exports.YJ = Em.Application.create(

  ready: ->
    @initialize()
    #@set('currentUser', YJ.createUser("dummy", "dummy@example.com")) # Stub current user until we get auth done.

)

YJ.store = DS.Store.create(
  revision: 4,
  adapter: DS.RESTAdapter.create(bulkCommit: false)
)



YJ.initialize()

YJ.reopen(
  createUser: (name, email) ->
    YJ.User.createRecord(name: name, email: email)
)

YJ.searchTerm = Em.Object.create(term: null)

