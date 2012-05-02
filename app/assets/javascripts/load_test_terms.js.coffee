# A routine to load test users.
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
