#= require ../spec_helper
#= require ../support/test_helper

describe("Terms", ->

  before ->
    Ember.run(YJ, YJ.advanceReadiness)

  after ->
    YJ.reset()

  it("displays list", ->
    visit("/terms").then( ->
      expect(testing(YJ).path()).to.equal('terms.index')
      resume()
    )
  )
)



