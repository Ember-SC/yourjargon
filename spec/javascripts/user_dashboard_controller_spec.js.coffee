describe "user_dashboard_controller", ->
  beforeEach ->
    @user = YJ.createUser('Test User', 'test@example.com')
    @betaOrg = @user.createOrganization('Beta')
    @alphaOrg = @user.createOrganization('Alpha')

  it "shows a list of organizations that the user belongs to", ->
    dashboardController = YJ.router.get('dashboardController')
    dashboardController.set('content', @user)
    dashboardController.set('organizations', @user.get('organizations'))
#    expect(@user.get('memberships.length')).toBe(2)
#    expect(dashboardController.get('organizations.length')).toBe(2)
#
#  it "can select an organization from the list", ->
#
#  it "enables creating an organization", ->
#
#  it "enables deleting an owned organization", ->
#
#  it "disables deleting an organization not owned", ->


