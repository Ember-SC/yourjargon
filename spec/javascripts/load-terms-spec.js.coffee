describe "Load terms", ->
  beforeEach ->
    @ctl = YJ.termsController

  it "generate terms into a controller", ->
    expect(@ctl.get('content').length).toBe(3)

