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
    memberships = @org.get('memberships')
    membership = memberships.objectAt(0)
    expect(membership.get('user.name')).toBe('test')

  describe "members and organization", ->
    beforeEach ->
      @org = @testUser.createOrganization('test organization')
      @anotherUser = YJ.User.createRecord(name: 'another user', email: 'another@example.com')
      @anotherUser.join(@org)

    it "member joins an organization", ->
      expect(@org.get('memberships.length')).toBe(2)

    it "member leaves an organization", ->
      @anotherUser.leave(@org)
      expect(@org.get('memberships.length')).toBe(1)
