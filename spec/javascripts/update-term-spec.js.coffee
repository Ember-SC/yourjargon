describe "Update an existing Term", ->
  beforeEach ->
    @ctl = YJ.termsController
    @ctl.set('content', [])
    @ctl.loadTermsForTesting()

  it "Update term 'Mitt' to be 'Mitty'", ->
    expect(@ctl.get('content').length).toBe(3)
    term = @ctl.get('content').findProperty('term', 'Mitt')
    expect(term).toBeDefined()
    expect(term.get('term')).toBe('Mitt')
    term.set('term', 'Mitty')
    expect(@ctl.get('content').length).toBe(3)
    expect(@ctl.get('content')[0].get('term')).toBe('Mitty')

  it "Update term 'Mitt' to be 'Zack'", ->
    term = @ctl.get('content').findProperty('term', 'Mitt')
    expect(term).toBeDefined()
    term.set('term', 'Zack')
    expect(@ctl.get('content').length).toBe(3)
    expect(@ctl.get('content')[2].term).toBe('Zack')

