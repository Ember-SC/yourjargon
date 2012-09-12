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

  it "has an arranged content filter property", ->
    expect(@tc.get('filtered')).toBeDefined

  it "has content that should be empty", ->
    expect(@tc.get('content.length')).toBe(0)

  describe "contents", ->

    beforeEach ->
      @obama =  @org.publishDefinedTerm("Obama", "Good speaker")

    it "should not have put this into the controller 'content' because automatic controllers updates are handled by the router", ->
      expect(@tc.get('content.length')).toBe(0)

    it "can load its contents with test data", ->
      @tc.addObject(@obama)
      expect(@tc.get('content.length')).toBe(1)
      expect(@tc.objectAt(0)).toBe(@obama)

    describe "sorted", ->

      beforeEach ->

        # Jasmine doesn't reset controller arrays between tests so we have to do it ourselves.
        # I consider this to be a bug in Jasmine:
        @tc.set('content', [])

        @romney = @org.publishDefinedTerm("Romney", "Rich Guy")
        @ryan = @org.publishUndefinedTerm("Ryan")

      it "reads the arranged content in sorted order even though they were not entered that way", ->
        expect(@tc.get('content.length')).toBe(0)
        @tc.addObject(@romney)
        @tc.addObject(@obama)
        expect(@tc.get('arrangedContent.length')).toBe(2)
        expect(@tc.get('arrangedContent').objectAt(0).get('name')).toBe("Obama")
        expect(@tc.get('arrangedContent').objectAt(1).get('name')).toBe("Romney")

      it "returns only search matches in sorted order", ->
        expect(@tc.get('content.length')).toBe(0)
        @tc.addObject(@ryan)
        @tc.addObject(@romney)
        @tc.addObject(@obama)
        @tc.set('searchLetter', 'R')
        sorted = @tc.get('filtered')
        expect(sorted.get('length')).toBe(2)
        expect(sorted.objectAt(0).get('name')).toBe("Romney")
        expect(sorted.objectAt(1).get('name')).toBe("Ryan")

      it "returns only defined terms in sorted order", ->
        expect(@tc.get('content.length')).toBe(0)
        @tc.addObject(@ryan)
        @tc.addObject(@romney)
        @tc.addObject(@obama)
        @tc.set('searchLetter', null)
        @tc.set('isDefined', true)
        expect(@tc.get('content.length')).toBe(3)
        sorted = @tc.get('filtered')
        expect(sorted.get('length')).toBe(2)
        expect(sorted.objectAt(0).get('name')).toBe("Obama")
        expect(sorted.objectAt(1).get('name')).toBe("Romney")

      it "returns only undefined terms starting with 'R'", ->




