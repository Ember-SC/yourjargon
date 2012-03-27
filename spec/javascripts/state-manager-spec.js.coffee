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

  it "edits an existing term", ->
    @stateManager.goToState("listTermsState")
    expectedTerm = @tc.content[1]
    @stateManager.send('editTerm', expectedTerm)
    expect(@stateManager.currentState).toBe(@stateManager.getState('editTermState'))
    oldTerm = YJ.currentTerm.get('oldTerm')
    expect(oldTerm.get('term')).toBe(expectedTerm.get('term'))
    expect(oldTerm.get('description')).toBe(expectedTerm.get('description'))
    newTerm = YJ.currentTerm.get('newTerm')
    expect(newTerm.get('term')).toBe(expectedTerm.get('term'))
    expect(newTerm.get('description')).toBe(expectedTerm.get('description'))
    expect(newTerm).toNotBe(oldTerm)
    expect(oldTerm).toBe(expectedTerm)
    expect(@tc.get('content').length).toBe(3)

  describe "for edit term", ->

    beforeEach ->
      @stateManager.goToState("listTermsState")
      expectedTerm = @tc.content[1]
      @stateManager.send('editTerm', expectedTerm)
      @newTerm = YJ.currentTerm.get('newTerm')

    it "updates an existing user", ->
      @newTerm.set('description', "something else")
      @stateManager.send('updateTerm')
      actualTerms = @tc.get('content')
      expectedDescriptions = ['has a lot of money', 'something else', 'Dan Savage coined his last name']
      for description, i in expectedDescriptions
        expect(actualTerms[i].get('description')).toBe(description)

    it "cancels editing an existing term", ->
      @newTerm.set('description', "something else")
      @stateManager.send('cancelEditCurrentTerm')
      actualTerms = @tc.get('content')
      expectedDescriptions = ['has a lot of money', 'plays fast and loose in debates', 'Dan Savage coined his last name']
      for description, i in expectedDescriptions
        expect(actualTerms[i].get('description')).toBe(description)

    it "deletes an existing term", ->
      @newTerm.set('description', "something else")
      @stateManager.send('deleteCurrentTerm')
      actualTerms = @tc.get('content')
      expectedDescriptions = ['has a lot of money', 'Dan Savage coined his last name']
      for description, i in expectedDescriptions
        expect(actualTerms[i].get('description')).toBe(description)

  it "shows a list of terms filtered by the first letter in the term", ->
