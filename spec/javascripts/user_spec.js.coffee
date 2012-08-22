describe "User", ->

  beforeEach ->
    @testUser = YJ.User.createRecord(name: 'test', email: 'test@example.com')

  afterEach ->

  it "should exist on YJ", ->
    uc = YJ.router.get('userController')
    uc.set('content', @testUser)
    expect(uc.get('content')).toBeDefined()

  it "member creates an organization", ->
    @org = @testUser.createOrganization('test organization')
    console.log(@org.get('memberships'))
    memberships = @org.get('memberships')
    membership = memberships.objectAt(0)
    expect(membership.get('user.name')).toBe('test')

#  it "member leaves an organization", ->
#    newMember = YJ.User.createRecord(name: "description")
#    newMember.join(@org)
#    previousLength = @org.memberships.get('length')
#    newMember.leave(@org)
#    expect(@org.memberships.get('length')).toBe(previousLength-1)
