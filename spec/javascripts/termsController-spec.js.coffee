describe "Terms controller", ->
  it "can purge its contents", ->
    tc = YJ.termsController
    tc.purge()
    expect(tc.get('content').length).toBe(0)

  it "can load its contents with test data", ->
    tc = YJ.termsController
    tc.purge()
    t = YJ.Term.create(term: "Obama", description: "Good speaker")
    tc.add(t)
    terms = tc.get('content')
    expect(terms.length).toBe(1)
    expect(terms[0]).toBe(t)

