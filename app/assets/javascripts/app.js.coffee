###
  The creation of the Your Jargon ('YJ') namespace
###
exports = this

exports.YJ = Em.Application.create(
  ready: ->
    YJ.set('termsController', YJ.TermsController.create(Ember.Sortable, {content: []}))
    YJ.get('termsController').initialLoad()
    YJ.initialize()
)

YJ.store = DS.Store.create(
  revision: 4,
  adapter: DS.RESTAdapter.create(bulkCommit: false)
)

