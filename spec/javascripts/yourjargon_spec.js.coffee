describe "Submiting a term", ->

  beforeEach ->
    tc = YJ.termsController
    len = tc.get('length')
    tc.removeAt(0, len) if (len > 0)

  it "with no definition will be added to the list of terms", ->
    term = YJ.Term.create(term: "a term")
    expect(YJ.termsController.get("length")).toBe 0
    YJ.submitTerm(term)
    expect(YJ.termsController.get("length")).toBe 1

  it "with definition will be added to the list of terms", ->
    term = YJ.Term.create(term: "another term")
    term.set("definition", "a definition")
    expect(YJ.termsController.get("length")).toBe 0
    YJ.submitTerm(term)
    expect(YJ.termsController.get("length")).toBe 1
