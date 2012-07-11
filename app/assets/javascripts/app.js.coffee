###
  The creation of the Your Jargon ('YJ') namespace
###
exports = this

exports.YJ = Em.Application.create(
  ready: ->
    YJ.initialize()
    YJ.router.get('termsController').initialLoad()
)

YJ.store = DS.Store.create(
  revision: 4,
  adapter: DS.RESTAdapter.create(bulkCommit: false)
)

