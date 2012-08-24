describe "organization routes", ->

  describe "the organizations states", ->

    it "has a state to show a list of organizations that the user belongs to", ->
      YJ.router.transitionTo('organizations.index')
      expect(YJ.router.get('currentState.name')).toBe('index')

    describe "has a state that shows the overall information for an organization", ->

      it "shows the organization name", ->

      it "shows defined terms", ->

      it "shows undefined terms", ->

      it "shows its members", ->

      it "can add a member", ->

    it "has a state to capture the information needed to make a new organization", ->

    it "has a state to capture the information needed to edit an organization", ->

  describe "the organizations events", ->

    it "creating an organization goes to looking at the list of organizations for the user", ->

    it "editing an organization goes to looking at the list of organizations for the user", ->

    it "deleting an organization goes to looking at the list of organizations for the user", ->

    it "selecting an organization from this users' organization list goes to show that organizations information", ->

    it "enroll a user to an organization shows a list of members", ->
