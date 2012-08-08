describe 'OrganizationsController spec', ->
  beforeEach ->
    @org_controller = YJ.router.get('organizationsController')
  afterEach ->
    @org_controller = null
    YJ.router.get('organizationsController').set('content', [])

  it 'can add an organization', ->
    owner = YJ.User.createRecord(name: 'Test Owner')
    organization = @org_controller.add('Test Organization', owner)
    content = @org_controller.get('content')
    expect(content.get('length')).toBe(1)
    expect(content.get('firstObject')).toBe(organization)