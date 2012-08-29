YJ.OrganizationNewController = Ember.ObjectController.extend(
  content: null

  # Persist what we've built in this controller
  create: ->
    organization = @get('content')
    #organization.get('transaction').commit()

)
