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
    @org = YJ.router.get('organizationController').add("Test Organization", owner)

  afterEach ->
    @org = null

  it "is defined", ->
    expect(@org).toBeDefined()

  it "has a name", ->
    @org.set('name', "An organization name")
    expect(@org.get('name')).toBe('An organization name')

  it "has an owner", ->
    expect(@org.getOwner.get('name').toBe('Owner User'))

  it "has terms", ->
    @org.publish(Term.createRecord(name:"Term", description: "Description"))
    expect(@org.get('terms').get('length')).toBe('1')

  it "retrieves a list of its members", ->
    newMember = YJ.User.createRecord(name: "description")
    newMember.join(@org)
    expect(@org.members).toContain(newMember)

  it "raise exception when name for creating an organization already exists", ->
    @org = YJ.router.get('organizationController').add("Test Organization", owner)


