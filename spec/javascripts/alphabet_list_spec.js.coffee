describe "building an alphabet selection list", ->

  beforeEach ->
    ac = YJ.alphabetController
    len = ac.get('length')
    ac.removeAt(0, len) if (len > 0)

  it "has a view that can contain the alphabet selection list", ->


  it "builds the contents for the alphabet selection list", ->
    ac = YJ.alphabetController
    expect(ac.get('length')).toBe 0
    ac.populate()
    expect(ac.get('length')).toBe 36
    expect(ac.content[0]).toBe 'A'
    expect(ac.content[25]).toBe 'Z'
    expect(ac.content[26]).toBe '0'
    expect(ac.content[35]).toBe '9'

