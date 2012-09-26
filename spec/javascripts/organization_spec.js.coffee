##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:17 PM
# To change this template use File | Settings | File Templates.
#

describe "Organization", ->

  beforeEach ->
    @owner = YJ.createUser('Owner User', 'owner.user@example.com')
    @org = @owner.createOrganization('test organization')

  afterEach ->
    @org = null

  it "is defined", ->
    expect(@org).toBeDefined()

  it "has a name", ->
    @org.set('name', "An organization name")
    expect(@org.get('name')).toBe('An organization name')

  it "has an owner", ->
    expect(@org.get('ownedBy.name')).toBe('Owner User')

  it "has memberships", ->
    expect(@org.get('memberships.length')).toBe(1)

  it "has a membership for this user", ->
    expect(@org.get('memberships').get('firstObject').get('user')).toBe(@owner)

  it "finds a membership for a user", ->
    expect(@org.membershipForUser(@owner).get('isOwner')).toBe(true)

  describe "enrollment", ->
    beforeEach ->
      @member = YJ.createUser('Test User', 'test@example.com')
      @membership = @org.enroll(@member)

    afterEach ->
      @member = null
      @membership = null

    it "enrolls a user", ->
      expect(@membership.get('user')).toBe(@member)

    it "enrolled user is not owner", ->
      expect(@membership.get('isOwner')).toBe(false)

  it "has terms", ->
    @org.publish(YJ.Term.createRecord(name:"Term", description: "Description"))
    expect(@org.get('terms').get('length')).toBe(1)

  it "retrieves a list of its members", ->
    newMember = YJ.User.createRecord(name: "description", email: "new@example.com")
    newMember.join(@org)
    expect(@org.get('memberships.length')).toBe(2)
#
#  it "raise exception when name for creating an organization already exists", ->
#    @org = YJ.router.get('organizationsController').add("Test Organization", @owner)


