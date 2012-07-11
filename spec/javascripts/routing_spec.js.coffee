describe "Given the Router", ->
  router = null
  beforeEach ->
    router = YJ.Router.create()

  afterEach ->
    router = null

  it "Should be defined", ->
    expect(router).toBeDefined()

  it "Should have an root route", ->
    expect(router.get("root")).toBeDefined()

  describe "its root route", ->
    root = null
    beforeEach ->
      root = router.get("root").create()

    afterEach ->
      root = null

    it "should have an home route", ->
      expect(root.get("home")).toBeDefined()