describe "State manager", ->
  beforeEach ->
    @stateManager = YJ.stateManager
    @tc = YJ.termsController
    @tc.purge()
    YJ.LoadTermsForTesting.create().execute()

  it "initial state is the list terms view", ->
    expect(@stateManager.currentState).toBe(@stateManager.getState('listTermsState'))

  it "edits a new term", ->
    @stateManager.goToState("listTermsState")
    @stateManager.send('newTerm')
    expect(@stateManager.currentState).toBe(@stateManager.getState('newTermState'))
    newTerm = YJ.currentTerm.get('newTerm')
    expect(newTerm.get('term')).toBe(null)
    expect(newTerm.get('description')).toBe(null)

  describe "for new term", ->

    beforeEach ->
      @stateManager.goToState('newTermState')
      newTerm = YJ.currentTerm.get('newTerm')
      newTerm.set('term', 'Ron')
      newTerm.set('description', 'Gold')

    it "creates a new term into the sorted list", ->
      @stateManager.send('addTerm')
      actualTerms = @tc.get('content')
      expectedTerms = ['Mitt', 'Newt', 'Ron', 'Santorum']
      for term, i in expectedTerms
        expect(actualTerms[i].get('term')).toBe(term)

    it "cancels editing a new term", ->
      @stateManager.send('cancelAddTerm')
      actualTerms = @tc.get('content')
      expectedTerms = ['Mitt', 'Newt', 'Santorum']
      for term, i in expectedTerms
        expect(actualTerms[i].get('term')).toBe(term)


  it "edits an existing term, ->"

  it "cancels editing an existing term", ->

  it "deletes an existing term", ->

  it "shows a list of terms filtered by the first letter in the term", ->
