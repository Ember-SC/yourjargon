###
  The creation of the Your Jargon ('YJ') namespace
###
exports = this
exports.YJ = Em.Application.create()
YJ.store = DS.Store.create(
  revision: 3,
  adapter: DS.RESTAdapter.create(bulkCommit: false)
)

