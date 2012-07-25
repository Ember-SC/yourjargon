##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:17 PM
# To change this template use File | Settings | File Templates.
#

describe "Organization", ->

  beforeEach ->
    @org = YJ.Organization.createRecord()

  afterEach ->
    @org = null

  it "has a name", ->

  it "has an owner", ->

  it "has terms", ->

  it "can retrieve a list of its members", ->

  it "can delete a member from a list of its members", ->

  it "owner can create a member", ->
