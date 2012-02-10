describe "Submiting a term", ->

  it "with no definition will be added to the list of undefined terms", ->
    term = YJ.Term.create(term: "a term")
    YJ.submitTerm(term)
    expect(YJ.undefinedTermsController.get("length")).toBe 1

  it "with definition will be added to the list of defined terms", ->
    term = YJ.Term.create(term: "another term")
    term.set("definition", "a definition")
    YJ.submitTerm(term)
    expect(YJ.definedTermsController.get("length")).toBe 1
