describe "State manager", ->
  beforeEach ->
    @stateManager = YJ.stateManager
    @tc = YJ.termsController
    @tc.purge()
    YJ.LoadTermsForTesting.create().execute()

  it "initial state is the list terms view", ->
    expect(@stateManager.currentState).toBe(@stateManager.getState('listTermsState'))

  it "shows ", ->
