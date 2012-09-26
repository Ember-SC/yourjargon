describe "User", ->

  it "can create a user", ->
    user = YJ.createUser('User', 'user@example.com')
    expect(user.get('name')).toBe('User')
    expect(user.get('email')).toBe('user@example.com')

  describe "things you can do with a user", ->
    beforeEach ->
      @testUser = YJ.createUser('test', 'test@example.com')

    afterEach ->

    it "should exist on YJ", ->
      uc = YJ.router.get('userController')
      uc.set('content', @testUser)
      expect(uc.get('content')).toBeDefined()
      expect(uc.get('content').get('name')).toBe('test')

    describe "members and organization", ->
      beforeEach ->
        @org = @testUser.createOrganization('test organization')

      afterEach ->
        @org = null

      it "member creates an organization", ->
        memberships = @org.get('memberships')
        expect(memberships.get('length')).toBe(1)
        membership = memberships.objectAt(0)
        expect(membership.get('user.name')).toBe('test')
        expect(membership.get('isOwner')).toBe(true)

      it "member joins an organization", ->
        anotherUser = YJ.createUser('another user', 'another@example.com')
        anotherUser.join(@org)
        expect(anotherUser.isOwner(@org)).toBe(false)
        expect(@org.get('memberships.length')).toBe(2)
        expect(@org.get('users.length')).toBe(2)

      it "member leaves an organization", ->
        @anotherUser.leave(@org)
        expect(@org.get('memberships.length')).toBe(1)


