describe "Data Store", ->
  Ember.run ->
    YJ.set('termsController', YJ.TermsController.create())
    #YJ.get('termsController').initialLoad()
    terms = YJ.get('termsController').get('content')
    length = terms.get('length')
    for term, i in terms
      YJ.get('termsController').remove
    YJ.get('termsController').remove(item) for item in terms
    YJ.store.commit()
    YJ.LoadTermsForTesting.create().execute()
    YJ.store.commit()

  beforeEach ->
    Ember.run()

  it "should have 3 entries", ->
    actualTerms = YJ.get('termsController').get('content')
    expect(actualTerms.get('length')).toBe(3)
    expectedTerms = ['Mitt', 'Newt', 'Santorum']
    for term, i in expectedTerms
      expect(actualTerms[i].get('term')).toBe(term)
