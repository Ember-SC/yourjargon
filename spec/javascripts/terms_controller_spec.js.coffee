describe "Terms controller", ->
  @tc = null
  beforeEach ->
    @tc = YJ.TermsController.create()
  it "has sortProperties as a property", ->
    expect(@tc.get('sortProperties')).toBeDefined

  it "has a property filter that returns arrangedContent", ->
    expect(@tc.get('filtered')).toBeDefined


  it "can load its contents with test data", ->
    t = YJ.store.createRecord(YJ.Term, term: "Obama", description: "Good speaker")
    @tc.addObject(t)
    expect(@tc.get('length')).toBe(1)
    expect(@tc.objectAt(0)).toBe(t)

