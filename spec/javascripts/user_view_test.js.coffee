describe "Users Organization Selection View", ->
  beforeEach ->
    publicOrgController = YJ.router.get('publicOrganizationController')
    publicOrgController.createPublicOrganization()
    owner = publicOrgController.enroll('Owner', 'owner@example.com')
    orgsController = YJ.router.get('organizationsController')
    @org1 = orgsController.add("Org1", owner)
    @org2 = orgsController.add("Org2", owner)
    @org3 = orgsController.add("Org3", owner)

  it "shows a list of organizations that the user belongs to", ->

  it "can select an organization from the list", ->

  it "enables creating an organization", ->

  it "enables deleting an owned organization", ->

  it "disables deleting an organization not owned", ->


