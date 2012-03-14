describe "Submiting a term", ->

  beforeEach ->
    @tc = YJ.termsController
    len = @tc.get('length')
    @tc.removeAt(0, len) if (len > 0)
    @term = YJ.Term.create(term: "a term")
    expect(@tc.get("length")).toBe 0

  it "with no definition will be added to the list of terms", ->
    @tc.set('currentTerm', @term)
    @tc.add(@term)
    expect(@tc.get("length")).toBe 1

  it "with definition will be added to the list of terms", ->
    @term.set("definition", "a definition")
    @tc.set('currentTerm', @term)
    @tc.add(@term)
    expect(@tc.get("length")).toBe 1
