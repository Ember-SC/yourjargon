##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:17 PM
# To change this template use File | Settings | File Templates.
#

describe "Organization", ->

  beforeEach ->
    publicOrg = YJ.get('publicOrganization')
    owner = publicOrg.createUser({
      name: 'Owner User',
      email: 'owner.user@example.com'
    })
    @org = YJ.createOrganization(owner)

  afterEach ->
    @org = null

  it "is defined", ->
    expect(@org).toBeDefined()

  it "has a name", ->
    @org.set('name', "An organization name")
    expect(@org.get('name')).toBe('An organization name')

  it "has an owner", ->
    expect(@org.get('owner').get('name').toBe('Owner User'))

  it "has terms", ->

  it "add"

  it "retrieves a list of its members", ->

  it "deletes a member from a list of its members", ->

  it "creates a member", ->
