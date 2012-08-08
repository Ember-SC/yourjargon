describe "User", ->

  beforeEach ->
    owner = YJ.User.createRecord(
      name: 'Owner User',
      email: 'owner.user@example.com'
    )
    YJ.router.get('organizationsController').add("Test Organization", owner)
    @org = YJ.router.get('organizationsController').get('firstObject')

  afterEach ->
    @org = null

  it "should exist on YJ", ->
    uc = YJ.router.get('userController')
    user = YJ.User.createRecord(name: 'Test User', email: 'test@example.com')
    uc.set('content', user)
    expect(uc.get('content')).toBeDefined()

#  it "member joins an organization", ->
#    newMember = YJ.User.createRecord(name: "description")
#    newMember.join(@org)
#    expect(@org.members.get('length')).toBe(1)
#
#  it "member leaves an organization", ->
#    newMember = YJ.User.createRecord(name: "description")
#    newMember.join(@org)
#    previousLength = @org.members.get('length')
#    newMember.leave(@org)
#    expect(@org.members.get('length')).toBe(previousLength-1)
