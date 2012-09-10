describe "Terms controller", ->
  @tc = null
  @org = null
  @user = null

  beforeEach ->
    @user = YJ.createUser('user', 'email')
    @org = @user.createOrganization('an Org')
    @tc = YJ.TermsController.create()

  it "has sortProperties as a property", ->
    expect(@tc.get('sortProperties')).toBeDefined

  it "has a property filter that returns arrangedContent", ->
    expect(@tc.get('filtered')).toBeDefined

  it "has content that should be empty", ->
    expect(@tc.get('length')).toBe(0)

  describe "contents", ->

    beforeEach ->
      @t =  @org.publishDefinedTerm("Obama", "Good speaker")

    it "should not have put this into the controller 'content'", ->
      expect(@tc.get('length')).toBe(0)

    it "can load its contents with test data", ->
      @tc.addObject(@t)
      expect(@tc.get('length')).toBe(1)
      expect(@tc.objectAt(0)).toBe(@t)

    describe "sorted", ->

      beforeEach ->

        # Jasmine doesn't reset controller arrays between tests so we have to do it ourselves.
        # I consider this to be a bug in Jasmine:
        @tc.replaceContent(0, 1, null)
        @t2 = @org.publishDefinedTerm("Romney", "Rich Guy")

      it "should have 'reset out' the previous tests's contents", ->
        expect(@tc.get('length')).toBe(0)
        @tc.addObject(@t2)
        @tc.addObject(@t)
        expect(@tc.get('length')).toBe(2)
        something = @tc.get('content').objectAt(0)
        console.log("something is #{something}")
        console.log("something.name is #{something.get('name')}")

        expect(something.get('name')).toBe("Obama")
#(@tc.get('length')).toBe(0)
#
#      it "can order out-of-order terms", ->





