describe "Data Store", ->
  it "should have four entries", ->
    terms = YJ.store.findAll(YJ.Term)
    expect(terms.get('length')).toBe(4)

  it "should have Mitt in the first term", ->
    terms = YJ.store.findAll(YJ.Term)
    expect(terms[0].get("term")).toBe("Mitt")