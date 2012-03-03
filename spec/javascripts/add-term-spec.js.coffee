describe "Add a new Term", ->
  it "when the new button is clicked it sends a new Term message to the termController", ->
    view = YJ.NewButtonView.create()
    tc = YJ.termController
    tc_spy = sinon.spy(tc, 'newTerm')
    view.new()
    expect(tc_spy).toHaveBeenCalled()