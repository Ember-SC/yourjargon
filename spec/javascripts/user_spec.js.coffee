describe "User", ->

  beforeEach ->

    @publicOrganizationController = YJ.router.get('publicOrganizationController')
    @publicOrganizationController.createPublicOrganization()
    owner = @publicOrganizationController.enroll('owner User', 'owner.user@example.com')
    orgsController = YJ.router.get('organizationsController')
    orgsController.add("Test Organization", owner)
    @org = orgsController.get('firstObject')

  afterEach ->
    @org = null

  it "should exist on YJ", ->
    uc = YJ.router.get('userController')
    user = YJ.User.createRecord(name: 'Test User', email: 'test@example.com')
    uc.set('content', user)
    expect(uc.get('content')).toBeDefined()

  it "member joins an organization", ->
    newMember = YJ.User.createRecord(name: "description")
    newMember.join(@org)
    expect(@org.memberships.get('length')).toBe(1)
#
#  it "member leaves an organization", ->
#    newMember = YJ.User.createRecord(name: "description")
#    newMember.join(@org)
#    previousLength = @org.memberships.get('length')
#    newMember.leave(@org)
#    expect(@org.memberships.get('length')).toBe(previousLength-1)
