describe "Add a new Term", ->
  it "when the new button is clicked it sends a new Term message to the termController", ->
    view = YJ.newButtonView
    tc = YJ.termController
    tc_spy = sinon.spy(tc, 'newTerm')
    view.click()
    expect(tc_spy).toHaveBeenCalled()