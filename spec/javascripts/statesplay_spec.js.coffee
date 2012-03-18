describe "State Manager", ->
  it "can find states", ->
    states =
      loading: Ember.State.create
      loaded: Ember.State.create
    stateManager = Ember.StateManager.create
      states: states
    expect(stateManager.get('states')).toBe(states)

  it "empty state's current state is null", ->
    stateManager = Ember.StateManager.create()
    expect(stateManager.get('currentState')).toBe(null)

  it "can find the initial state", ->
    startState = Ember.State.create(isStart: true)
    stateManager = Ember.StateManager.create(start: startState)
    expect(stateManager.get('currentState').isStart).toBe(true)

