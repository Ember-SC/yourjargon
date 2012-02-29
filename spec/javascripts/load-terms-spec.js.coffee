describe "Load terms", ->
  beforeEach ->
    @ctl = YJ.termsController
    t1 = YJ.Term.create("Mitt")
    t1.set('description', 'has a lot of money')
    t2 = YJ.Term.create("Newt")
    t2.set('description', 'plays fast and loose in debates')
    t3 = YJ.Term.create("Santorum")
    t3.set('description', 'Dan Savage coined his last name')
    @ctl.pushObject(t1)
    @ctl.pushObject(t2)
    @ctl.pushObject(t3)

  it "generate terms into a controller", ->
    expect(@ctl.get('content').length).toBe(3)

