##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:17 PM
# To change this template use File | Settings | File Templates.
#

describe "Organization", ->

  beforeEach ->
    owner = YJ.User.createRecord(
      name: 'Owner User',
      email: 'owner.user@example.com'
    )
    YJ.router.get('organizationsController').add("Test Organization", owner)
    @org = YJ.router.organizationsController.get('firstObject')

  afterEach ->
    @org = null
    YJ.router.organizationsController.set('content', [])


  it "is defined", ->
    expect(@org).toBeDefined()

  it "has a name", ->
    @org.set('name', "An organization name")
    expect(@org.get('name')).toBe('An organization name')

  it "can enroll a user", ->
    user = YJ.User.createRecord(name: 'Test User', email: 'test@example.com')
    membership = @org.enroll(user)
    expect(@org.get('memberships').get('lastObject')).toBe(membership)

  it "has an owner", ->
    expect(@org.ownedBy().get('name')).toBe('Owner User')

  it "has terms", ->
    @org.publish(YJ.Term.createRecord(name:"Term", description: "Description"))
    expect(@org.get('terms').get('length')).toBe(1)

  it "retrieves a list of its members", ->
    newMember = YJ.User.createRecord(name: "description")
    newMember.join(@org)
    expect(@org.get('memberships').get('length')).toBe(2)

#  it "raise exception when name for creating an organization already exists", ->
#    @org = YJ.router.get('organizationsController').add("Test Organization", owner)


