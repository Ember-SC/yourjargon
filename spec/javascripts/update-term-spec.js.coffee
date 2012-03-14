describe "Update an existing Term", ->
  beforeEach ->
    @ctl = YJ.termsController
    @ctl.load

  it "Update term 'Mitt' to be 'Mitty'", ->
    term = @ctl.get('content').findProperty('term', 'Mitt')
    expect(term).toBeDefined()
    expect(term.get('term')).toBe('Mitt')
    term.set('term', 'Mitty')
    expect(@ctl.get('content').length).toBe(3)
