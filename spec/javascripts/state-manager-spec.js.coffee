describe "State manager", ->
  beforeEach ->
    @stateManager = YJ.stateManager

  it "has a state manager", ->
    expect(@stateManager).toNotBe(null)

  it "has a list terms state with a list terms view", ->
    state = @stateManager.listTermsState
    expect(state).toNotBe(null)
    expect(state.get('view')).toNotBe(null)

  it "has a new term state with a new term view", ->
    state = @stateManager.newTermState
    expect(state).toNotBe(null)
    expect(state.get('view')).toNotBe(null)

  it "has an edit term state with an edit term view", ->
    state = @stateManager.editTermState
    expect(state).toNotBe(null)
    expect(state.get('view')).toNotBe(null)

  it "has the list terms state set as the start state", ->
    state = @stateManager.listTermsState
    expect(state.isStart).toBeTrue

  it "does not have the edit term state set as the start date", ->
    state = @stateManager.editTermState
    expect(state.isStart).toBeFalsy()
