describe "Dummy", ->
  it "shows that jasmine works ", ->
    expect(false).toEqual(false)

describe "Add a term with a definition", ->
	it "will be added to the list of defined terms", ->
		term = new YJ.Term ("a_term")
		term.set("definition", "a definition")
		YJ.definedTermsController.count.should == 0
		YJ.definedTermsController.add(term)
		YJ.definedTermsController.count.should == 1
