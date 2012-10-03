describe "organization routes", ->

  describe "the organizations states", ->

    it "has a state to create an organization", ->
      YJ.router.transitionTo('organizations.new')
      expect(YJ.router.get('currentState.name')).toBe('new')

    it "has a state to show a list of organizations that the user belongs to", ->
      YJ.router.transitionTo('organizations.index')
      expect(YJ.router.get('currentState.name')).toBe('index')

    describe "has a state that shows the overall information for an organization", ->

      beforeEach ->
        user = YJ.createUser('user name', 'user@example.com')
        @organization = user.createOrganization('an organization')
        YJ.router.transitionTo('organizations.organization.show', @organization)

      it "is in the state for showing an organization", ->
        expect(YJ.router.get('currentState.name')).toBe('show')

      it "shows the organization name", ->
        expect(YJ.router.get('organizationController.content.name')).toBe('an organization')

#      it "shows defined terms", ->
#        @organization.publishDefinedTerm('a defined term', 'a definition')
#        expect(YJ.router.get('definedTermsController.content.length')).toBe(1)
#
#      it "shows undefined terms", ->
#        @organization.publishUndefinedTerm('an undefined term')
#        expect(YJ.router.get('organizationController.content.undefinedTerms.length')).toBe(1)

      it "shows its members", ->

      it "can invite a member to join", ->

      it "has a state to capture the information needed to make a new organization", ->

      it "has a state to capture the information needed to edit an organization", ->
      
      it "creates a term for the organization", ->
        term = @organization.publishDefinedTerm("A term", "A description")
        console.log(YJ.router.get("currentPath"))
        YJ.router.transitionTo('terms.edit')
        YJ.router.send('termCreated')
        Ember.run.next( ->
          currentPath = YJ.router.get('currentPath')
          expect(currentPath).toBe('organizations.organization.show')
        )



  describe "the organizations events", ->

    it "creating an organization goes to looking at the list of organizations for the user", ->

    it "editing an organization goes to looking at the list of organizations for the user", ->

    it "deleting an organization goes to looking at the list of organizations for the user", ->

    it "selecting an organization from this users' organization list goes to show that organizations information", ->

    it "enroll a user to an organization shows a list of members", ->


