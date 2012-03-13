describe "Filtered terms", ->

  beforeEach ->
  @ctl = YJ.termsController
  @ctl.set('content', [])
  @ctl.load()

  it "matches the first letter of the term to the submitted letter", ->
#    letter = 'A'
#    @pushObject(YJ.Term.create(term: "apple", definition: "an apple"))
#    @set('searchLetter', 'A')
#    filtered = @get('filtered')
#    expect(filtered.length).toEqual(1)

