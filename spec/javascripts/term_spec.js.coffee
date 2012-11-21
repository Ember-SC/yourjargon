describe "Term", ->
  @term = null
  beforeEach ->
    @term = YJ.store.createRecord(YJ.Term,
      {name: 'dummyTerm',
      description: 'dummyDescription'}
    )
  afterEach ->
    @term = null

  it "can return the first letter of name capitalized", ->
    expect(@term.get('firstLetter')).toBe("D")

  it "fails", ->
    expect(true).toBe(false)
