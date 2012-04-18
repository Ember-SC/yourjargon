# This file contains actions to be performed after all the
# your jargon coffeescript code is required.

# This will come out before release:

# This is temporary so that we can see some generated data on the list page.  It will come out after we get ember-data going.
YJ.LoadTermsForTesting = Em.Object.extend(

  execute: ->
    t = YJ.store.createRecord(YJ.Term, {term: "Newt"})
    t.set('description', 'plays fast and loose in debates')
    YJ.termsController.add(t)
    t = YJ.store.createRecord(YJ.Term, {term: "Mitt"})
    t.set('description', 'has a lot of money')
    YJ.termsController.add(t)
    t = YJ.store.createRecord(YJ.Term, {term: "Santorum"})
    t.set('description', 'Dan Savage coined his last name')
    YJ.termsController.add(t)
)

# While we have persistence running, don't generate test users:
#YJ.LoadTermsForTesting.create().execute()

# Wait for everything to load, then start by listing all the terms
YJ.ready = ->
  terms = YJ.store.findAll(YJ.Term)
  for term in terms
    do (term) ->
      YJ.termsController.add(term)
  YJ.stateManager = YJ.StateManager.create()
  YJ.stateManager.goToState('listTermsState')
