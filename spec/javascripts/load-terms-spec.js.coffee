describe "Load terms", ->
  beforeEach ->
    @ctl = YJ.termsController
    @ctl.set('content', [])
    @ctl.load()

  it "generate terms into a controller", ->
    expect(@ctl.get('content').length).toBe(3)

