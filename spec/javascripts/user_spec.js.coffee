describe "User", ->

  beforeEach ->
    owner = YJ.User.createRecord(
      name: 'Owner User',
      email: 'owner.user@example.com'
    )
    @org = YJ.Organization.add(name: "Test Organization", owner: owner)

  afterEach ->
    @org = null

  it "should exist on YJ", ->
    expect(YJ.router.get('userController').content).toBeDefined()

  it "member joins an organization", ->
    newMember = YJ.User.createRecord(name: "description")
    newMember.join(@org)
    expect(@org.members.get('length')).toBe(1)

  it "member leaves an organization", ->
    newMember = YJ.User.createRecord(name: "description")
    newMember.join(@org)
    previousLength = @org.members.get('length')
    newMember.leave(@org)
    expect(@org.members.get('length')).toBe(previousLength-1)
