describe "Dummy", ->
  it "shows that jasmine works ", ->
    expect(false).toEqual(false)

describe "Add a term with a definition", ->
	it "will be added to the list of defined terms", ->
    definedTerms = YJ.definedTermsController
    expect(definedTerms.get("length")).toBe 0
    term = YJ.Term.create(term: "a term")
    term.set "definition", "a definition"
    definedTerms.pushObject term
    expect(definedTerms.get("length")).toBe 1
