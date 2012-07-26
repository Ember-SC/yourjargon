###
  The creation of the Your Jargon ('YJ') namespace
###
exports = this

exports.YJ = Em.Application.create(

  createPublicOrganization: (owner) ->
    publicOrg = YJ.Organization.create()
    publicOrg.setOwner(YJ.currentUser)
    publicOrg.setPublic()
    # YJ.store.commit()
    publicOrg

  ready: ->
    YJ.initialize()
    YJ.currentUser = YJ.User.createRecord()

    # FIXME: How do I keep a public organization around while testing?
    YJ.publicOrganization = YJ.createPublicOrganization())

YJ.store = DS.Store.create(
  revision: 4,
  adapter: DS.RESTAdapter.create(bulkCommit: false)
)

YJ.searchTerm = Em.Object.create(term: null)

