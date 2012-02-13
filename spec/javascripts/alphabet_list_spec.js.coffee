describe "building an alphabet selection list", ->

  beforeEach ->
    ac = YJ.alphabetController
    len = ac.get('length')
    ac.removeAt(0, len) if (len > 0)

#  it "has a view that can contain the alphabet selection list", ->

  it "builds the contents for the alphabet selection list", ->
    ac = YJ.alphabetController
    expect(ac.get('length')).toBe 0
    ac.populate()
    expect(ac.get('length')).toBe 26

