# This file contains actions to be performed after all the
# your jargon coffeescript code is required.

# Accumulate the terms from the server into
# this temporary array. See YJ.tempTerms for more
# information.
# TODO: shouldn't require separate tempTerms array
# from termsController array.  Merge into termsController.

# Wait for everything to load, then start by listing all the terms
YJ.ready = ->
  YJ.set('termsController', YJ.TermsController.create(Ember.Sortable, {content: []}))
  YJ.get('termsController').initialLoad()
  YJ.stateManager = YJ.StateManager.create()
  YJ.stateManager.goToState('loggedOutState')
