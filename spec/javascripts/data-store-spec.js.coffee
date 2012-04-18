describe "Data Store", ->
  Ember.run ->
    terms = YJ.termsController.get('content')
    YJ.termsController.remove(item) for item in terms
    YJ.store.commit()
    YJ.LoadTermsForTesting.create().execute()
    YJ.store.commit()

  beforeEach ->
    Ember.run()

  it "should have 3 entries", ->
    actualTerms = YJ.termsController.get('content')
    expect(actualTerms.get('length')).toBe(3)
    expectedTerms = ['Mitt', 'Newt', 'Santorum']
    for term, i in expectedTerms
      expect(actualTerms[i].get('term')).toBe(term)
