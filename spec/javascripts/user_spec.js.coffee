describe "current User", ->
  it "should exist on YJ", ->
    expect(YJ.router.get('userController').content).toBeDefined()
