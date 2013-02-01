YJ.OrganizationsNewController = Ember.ObjectController.extend(
  content: null

  setContentNewOrganization: ->
  	@set('content', YJ.Organization.build(YJ.get('currentUser'))

  # Persist what we've built in this controller
  create: ->
    organization = @get('content')
    organization.get('transaction').commit()

)
